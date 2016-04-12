var express = require('express')
  , app = express()
  , http = require('http')
  , server = http.createServer(app)
  , io = require('socket.io').listen(server);
var pg = require('pg');
var conString = "postgres://postgres:zxc@localhost:5432/jschat";

server.listen(3000);

// routing
app.get('/', function (req, res) {
  res.sendfile(__dirname + '/index.html');
});

// usernames which are currently connected to the chat
var usernames = {};
var srvpasswd = '';
var parti = [];
var id = 0;
var i = 0;
// rooms which are currently available in chat
var rooms = [];
var users = [];
var client = new pg.Client(conString);
client.connect();




//queries are queued and executed one after another once the connection becomes available
//var x = 1000;

//while(x>0)
//{
//client.query("INSERT INTO rooms(room) values('Ted')");
//client.query("INSERT INTO junk(name, a_number) values($1, $2)", ['John', x]);
//x = x - 1;
//}





io.sockets.on('connection', function (socket) {
var query = client.query("SELECT room FROM rooms");
//fired after last row is emitted
//console.log('on connection srv side');
rooms = [];
query.on('row', function(row) {
  //console.log(row);
  //room = JSON.stringify(row);
  //console.log(rooms);
  
  rooms.push(row.room);
  //console.log(rooms);
});

	
	// when the client emits 'sendchat', this listens and executes
	socket.on('sendchat', function (data) {
		//console.log(rooms);
		// we tell the client to execute 'updatechat' with 2 parameters
		io.sockets.in(socket.room).emit('updatechat', socket.username, data);
		//socket.emit('updaterooms', rooms, rooms[0]);
		//console.log(socket.room, socket.username, data);
		var str="";
		//str = data.toString();
		//console.log(data.includes('.invite'));
		var command = str.indexOf("00");
		if (command = -1){
			//console.log(var_dump(data));
			//console.log(str+' not a command '+command);
		}
		else {
			//console.log('not a command '+command);
		}
		client.query("INSERT INTO chat(room, username, msg, datee) values('"+socket.room+"','"+socket.username+"','"+data+"','now')");
	});
	socket.on('login', function (username, isguest) {
		// we tell the client to execute 'updatechat' with 2 parameters
		//io.sockets.in(socket.room).emit('updatechat', socket.username, data);
		//console.log(socket.room, socket.username, data);
		if(isguest == 'notguest'){
				var query = client.query("SELECT username, passwd FROM users where username = '"+username+"'");
//console.log(query);
//fired after last row is emitted
	//users =[];
	//console.log('login parameter:'+login)
	query.on('row', function(row) {
	//console.log(row);
  //room = JSON.stringify(row);  
	users.push(row.username);
	srvpasswd = row.passwd;
	if (users.indexOf(username) == -1) {
 //console.log(users.indexOf(login)); 
 //console.log(users);
 //console.log('user '+login+' not found in DB');}	  
 //rooms = [];
	socket.emit('regForm')}
	  else {
		
		socket.emit('askPasswd', username);
		}	  
	});
		}
		else{
			
			//console.log('guest connected '+username);
			socket.username = "guest"+username;
				socket.room = rooms[0];	
				usernames[username] = username;		
				socket.join(rooms[0]);
				socket.emit('updatechat', 'SERVER', 'you have connected to '+rooms[0]);
				socket.broadcast.to(rooms[0]).emit('updatechat', 'SERVER', username + ' has connected to this room');
	
				socket.emit('updaterooms', rooms, rooms[0]);
				
		}
		
	});
	socket.on('passwd', function (username, passwd) {
		// we tell the client to execute 'updatechat' with 2 parameters
		//io.sockets.in(socket.room).emit('updatechat', socket.username, data);
		//console.log(socket.room, socket.username, data);
		
		//console.log(username, passwd);
		//var query = client.query("SELECT passwd FROM users where username = '"+username+"' limit 1");
//fired after last row is emitted
	//query.on('row', function(row){
			//var srvlogin = login;
			//var passwddb  = srvpasswd;
			if (passwd == srvpasswd){
				//console.log('passwords are matched');
				socket.username = username;
				socket.room = rooms[0];	
				usernames[username] = username;		
				socket.join(rooms[0]);
				socket.emit('updatechat', 'SERVER', 'you have connected to '+rooms[0]);
				socket.broadcast.to(rooms[0]).emit('updatechat', 'SERVER', username + ' has connected to this room');
	
				socket.emit('updaterooms', rooms, rooms[0]);
				socket.emit('showRoomMgm');
				//console.log('on passwd endif');
				//rooms =[];
			
			}
			else{
				//console.log('on passwd '+srvpasswd);
				socket.emit('regForm');
				//console.log('passwords didn\'t matched');
				//rooms = [];
			}
	//console.log(passwd);
	//rooms =[];
	//});
	});
	
	//passwd = 
	//console.log(row);
  //room = JSON.stringify(row);  
	
	
	
	socket.on('switchRoom', function(newroom){
		//console.log(newroom);
		var query = client.query("select room, creator, participants, status from rooms  where room = '"+newroom+"'");
		query.on('row', function(row){
			//var str = row.status;
			//console.log(row);
			//console.log(socket.username);
			if (row.status == 'open'){
		socket.leave(socket.room);
		socket.join(newroom);
		socket.emit('updatechat', 'SERVER', 'you have connected to '+ newroom);
		// sent message to OLD room
		socket.broadcast.to(socket.room).emit('updatechat', 'SERVER', socket.username+' has left this room');
		// update socket session room title
		socket.room = newroom;
		socket.broadcast.to(newroom).emit('updatechat', 'SERVER', socket.username+' has joined this room');
		socket.emit('updaterooms', rooms, newroom);
			}
		else if(row.status = 'closed' && row.participants.indexOf(socket.username) == -1) {
			//console.log('room isn\'t open && you aren\'t in participants');
			socket.emit('updatechat', 'SERVER', 'room isn\'t open && you aren\'t in participants');
			
		}
		else {
			//console.log('room isn\'t open && you are in participants');
			//console.log(row.participants+'sad'+socket.username);
			socket.leave(socket.room);
		socket.join(newroom);
		socket.emit('updatechat', 'SERVER', 'you have connected to '+ newroom);
		// sent message to OLD room
		socket.broadcast.to(socket.room).emit('updatechat', 'SERVER', socket.username+' has left this room');
		// update socket session room title
		socket.room = newroom;
		socket.broadcast.to(newroom).emit('updatechat', 'SERVER', socket.username+' has joined this room');
		socket.emit('updaterooms', rooms, newroom);
		}
		});
		//console.log();
		
	});
	socket.on('addRoom', function(freshroom){
		//rooms.push(freshroom);
		var status = 'closed';
		var participants = socket.username;
		//var chk = "INSERT INTO rooms(room, creator, participants, status) values('"+freshroom+"','"+socket.username+"','{\""+socket.username+"\"}','"+status+"');";
		//console.log(chk);
		var usernames = client.query("select username from users");
		query.on('row', function(row){
				if (socket.username != row.username){
					console.log("you are guest");
				}
		});
		
		if (rooms.indexOf(freshroom) == -1) {
 try {
		
		client.query("INSERT INTO rooms(room, creator, participants, status) values('"+freshroom+"','"+socket.username+"','{\""+socket.username+"\"}','"+status+"');");
		}
		catch(err){
			console.log(err);			
		}
		rooms.push(freshroom);
		socket.emit('updaterooms', rooms, freshroom);		
		//socket.broadcast.emit('updaterooms', rooms, freshroom);		
		socket.emit('updatechat', 'SERVER', 'you have connected to '+ freshroom);
		//socket.broadcast.to(freshroom).emit('updatechat', 'SERVER', ' has connected to this room');
		io.emit('updaterooms', rooms, freshroom);
		//console.log(rooms+'updaterooms');
 }
	  else {
		//console.log('room '+freshroom+' is already exists');
		
		}	
		
		query.on('end', function() { 
  client.end();
});

		/*socket.leave(socket.room);
		socket.join(freshroom);
		socket.emit('updatechat', 'SERVER', 'you have connected to '+ newroom);
		// sent message to OLD room
		socket.broadcast.to(socket.room).emit('updatechat', 'SERVER', socket.username+' has left this room');
		// update socket session room title
		socket.room = freshroom;
		socket.broadcast.to(freshroom).emit('updatechat', 'SERVER', socket.username+' has joined this room');
		socket.emit('updaterooms', rooms, freshroom);
		*/
	});
	socket.on('rmRoom', function(rmroom){
		//rooms.push(rmroom);
		var i = rooms.indexOf(rmroom);
		client.query("delete from rooms where room='"+rmroom+"'");
		if(i != -1) {
		rooms.splice(i, 1);}
		//socket.emit('updaterooms', rooms, rooms[0]);
		io.emit('updaterooms', rooms, rooms[0]);
		//console.log(rooms);
		/*socket.leave(socket.room);
		socket.join(freshroom);
		socket.emit('updatechat', 'SERVER', 'you have connected to '+ newroom);
		// sent message to OLD room
		socket.broadcast.to(socket.room).emit('updatechat', 'SERVER', socket.username+' has left this room');
		// update socket session room title
		socket.room = freshroom;
		socket.broadcast.to(freshroom).emit('updatechat', 'SERVER', socket.username+' has joined this room');
		socket.emit('updaterooms', rooms, freshroom);
		*/
	});
	
	socket.on('invite', function(room, username){
		//var par;
		//console.log(room, username);
		
		var participants = client.query("select participants from rooms where room='"+room+"'");
		participants.on('row', function(row){
		parti.push(row.participants);
		parti.push(username);
		client.query("update rooms set participants = '{"+parti+"}' where room = '"+room+"'");
		//i = i+1;
		});
		//client.query("update rooms set participants=");
		//parti.push(username);
		console.log('i= '+i);
		parti.push(username);
		console.log('participants = '+parti);
	})

	// when the user disconnects.. perform this
	socket.on('disconnect', function(){
		// remove the username from global usernames list
		delete usernames[socket.username];
		// update list of users in chat, client-side
		io.sockets.emit('updateusers', usernames);
		// echo globally that this client has left
		socket.broadcast.emit('updatechat', 'SERVER', socket.username + ' has disconnected');
		socket.leave(socket.room);
		//rooms = [];
	});

//require('./pg.js').make(Schema, mongoose);
});
