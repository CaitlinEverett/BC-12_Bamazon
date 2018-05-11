//part one of the assignment 
const mysql = require('mysql');
const prompt = require('prompt');

//for formatting the table output in CLI
const colors = require('colors/safe');
const cliTable = require('cli-table');

//create a connection to the DB
const connection = mysql.createConnection({
	host: 'localhost',
	port: 8889,
	user: 'root',
	password: 'root',
	database: 'bamazon',
});

var productPurchased = [];


////////////////////////////////////////////
//connects to db
//does a query
connection.connect(function (err) {
	if (err) throw err;
	console.log("connected as id " + connection.threadId + "\n");

	connection.query('SELECT item_id, product_name, price, stock_quantity FROM products', function (err, result) {
		if (err) console.log(err);

		//graphical table in the cli
		var table = new cliTable({
			head: ['Item Id#', 'Product Name', 'Price', 'In Stock'],
			style: {
				head: ['magenta'],
				compact: false,
				colAligns: ['center']
			}
		});

		//makes table
		for (var i = 0; i < result.length; i++) {
			table.push(
				[result[i].item_id, result[i].product_name, result[i].price, result[i].stock_quantity]
			);
		}
		console.log(table.toString());

		//runs buy function
		buy();
	});
});



////////////////////////////////////////////
//prompts user for choice / quantity
//removes products from the db
var buy = function () {

	var productInfo = {
		properties: {
			item_id: {
				description: colors.magenta('Enter ID # of item you would like to buy')
			},
			Quantity: {
				description: colors.magenta('How many items would you like to purchase?')
			}
		},
	};

	prompt.start();

	prompt.get(productInfo, function (err, res) {

		var custPurchase = {
			item_id: res.item_id,
			Quantity: res.Quantity
		};

		productPurchased.push(custPurchase);

		connection.query('SELECT * FROM products WHERE item_id=?', productPurchased[0].item_id, function (err, res) {
			if (err) console.log(err, 'That item ID doesn\'t exist');

			if (res[0].stock_quantity < productPurchased[0].Quantity) {
				console.log('That product is out of stock!');
				connection.end();

			} else if (res[0].stock_quantity >= productPurchased[0].Quantity) {

				console.log('');

				console.log(productPurchased[0].Quantity + ' items ordered');

				console.log(res[0].product_name + ' ' + res[0].price);

				var saleTotal = res[0].price * productPurchased[0].Quantity;

				connection.query("UPDATE departments SET total_sales = ? WHERE department_name = ?;", [saleTotal, res[0].department_name], function (err, resultOne) {
					if (err) console.log('error: ' + err);
					return resultOne;
				})

				console.log('Total: ' + saleTotal);

				newQuantity = res[0].stock_quantity - productPurchased[0].Quantity;

				connection.query("UPDATE products SET stock_quantity = " + newQuantity + " WHERE item_id = " + productPurchased[0].item_id, function (err, res) {
					console.log('');
					console.log(colors.cyan('Thank you!'));
					console.log('');

					connection.end();
				})

			};

		})
	})

};