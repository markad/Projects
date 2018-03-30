var http=require('http');
var mongodb=require('mongodb');
var mongoClinet=mongodb.MongoClient;
var url="mongodb://localhost:27017";

function onRequest(req,res){
	
	console.log("Url pathi is "+req.url);
	res.writeHead(200,{'Context-Type':'text/plain'});
	res.write('Hello Node.js World!!!');
	res.end();
}


http.createServer(onRequest).listen(8888);
console.log('Server is now Runing...');

mongoClinet.connect(url,function(err,db){
	
	if(err){
		console.log(err);
	}else{
		console.log('Connect to url',url);
		var coll=db.collection('test');
		var doc1={'name':'Red Apple','color':'Red'};
		var doc2={'name':'Green Apple','color':'Green'};
		
		coll.insert([doc1,doc2],function(err,res){
			if(err){
				console.log(err);
			}else{
				console.log('%d Record is Inserted',res.insertedCount);
			}
		});
		db.close();

	}
	
});
