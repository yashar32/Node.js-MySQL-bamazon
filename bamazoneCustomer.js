var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,

//username
    user: "root",

// password
    password: "password",
    database: "Bamazon"
});

connection.connect(function(err) {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    revealInventory();
});

var productPurchased = [];

var revealInventory = function() {
  console.log("ID |  Product Name |  Department Name |  Price  | Stock Quantity" )
    connection.query("SELECT * FROM products", function(err, res) {
        for (var i = 0; i < res.length; i++) {
            console.log(res[i].id + " | " + res[i].product_name + " | " + res[i].department_name + " | $" + res[i].price + " | " + res[i].stock_quantity);
        }
        console.log("-----------------------------------");
        setTimeout(purchaseItem, 4000);
    });

};



var purchaseItem = function() {
    inquirer.prompt([{
        name: "itemID",
        type: "input",
        message: "What is the item ID of the product you would like to buy?"
    }, {
        name: "Quantity",
        type: "input",
        message: "How many would you like to buy?"
    }]).then(function(answer) {
        connection.query("SELECT * FROM products WHERE products.id = ?", [answer.itemID], function(err, res) {
            // console.log(res[0].item_id);
            // console.log(res[0].stock_quantity);

            if (res[0].id == answer.itemID && res[0].stock_quantity >= parseInt(answer.Quantity)) {
                var TotalPrice = res[0].price * parseInt(answer.Quantity);
                console.log("Your purchase was successful.");
                //console.log("You just spent: $" + TotalPrice);
                connection.query("UPDATE products SET ? WHERE ?", [{
                    stock_quantity: res[0].stock_quantity - parseInt(answer.Quantity)
                }, {
                    id: res[0].id
                }], function(err, res) {
                    setTimeout(revealInventory, 1000);

                    setTimeout(function(){console.log("You just spent: $" + TotalPrice)}, 2500);

                //setTimeout(console.log("You just spent: $" + TotalPrice), 4500);
                });
                //&& parseInt(res[0].stock_quantity) > parseInt(answer.Quantity)


            } else if (res[0].id == answer.itemID && res[0].stock_quantity < parseInt(answer.Quantity)) {
                setTimeout(function(){console.log("Not enough is in stock at the moment.")}, 2500);
                revealInventory();
            }

        });

    });
};
