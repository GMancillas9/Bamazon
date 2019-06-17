var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 8080
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "honey_snow9",
  database: "bamazon_db"
});

connection.connect(function (err) {
  if (err) throw err;
  console.log("connected as id " + connection.threadId);
  listProducts();
});

function listProducts() {
  connection.query("SELECT * FROM products", function (err, res) {
    for (var i = 0; i < res.length; i++) {
      console.log("ID:" + res[i].item_id + " | " + res[i].product_name + " | " + "$" + res[i].price);
    }
    console.log("-----------------------------------");

    purchase();

  });
}


function purchase() {
  inquirer.prompt([{
    name: "item_id",
    type: "input",
    message: "What is the ID of the product you'd like to purchase?",

  }, {
    name: "stock_quantity",
    type: "input",
    message: "How many would like to purchase?"

  }]).then(function (answer) {
    connection.query("SELECT * FROM products WHERE products.item_id = ?", [answer.item_id], function (err, res) {

      if (res[0].item_id == answer.item_id && res[0].stock_quantity >= parseInt(answer.stock_quantity)) {
        var totalPrice = res[0].price * parseInt(answer.stock_quantity);
        console.log("-----------------------------------");
        console.log("Processing your order.");
        console.log("-----------------------------------");
        console.log("Your total for this purchase is: $" + totalPrice);
        console.log("-----------------------------------");


        connection.query("UPDATE products SET ? WHERE ?", [{
          stock_quantity: res[0].stock_quantity - parseInt(answer.stock_quantity)
        }, {
          id: res[0].item_id
        }], function (err, res) {
          console.log("-----------------------------------");

          console.log("Would You Like to Buy Something Else?");
          console.log("-----------------------------------");

          listProducts();
        });

      } else if (res[0].item_id === answer.item_id && res[0].stock_quantity < parseInt(answer.stock_quantity)) {
        console.log("We don't have enough to supply your order!");
        listProducts();
      }

    });

  });
};

