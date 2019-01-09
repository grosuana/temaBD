
const express = require("express");
const app = express();
const database = require('./database');


app.get('/', function(req, res){
	console.log("aloo aloo")
	let ans = database.query("SELECT * FROM `users`")
	console.log(ans)
     res.send(ans);
});

app.get('/data', function(req, res))

app.listen(9000);