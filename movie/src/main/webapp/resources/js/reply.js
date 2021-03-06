//REPLY MODULE
var replyService = (function(){
	
	
	function add(reply, callback, error){
		console.log("add reply..........");
		
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
	}
	
	
	function getList(param, callback, error) {
		console.log("get reply..........");
		
		var seq = param.seq;
		var page = param.page || 1;
		
		$.getJSON("/replies/pages/" + seq + "/" + page + ".json",
			function(data) {
				if(callback) {
				
					//댓글 목록만 가져오는 경우.
					//callback(data);
					
					callback(data.replyCnt, data.list) // 댓글 숫자와 목록을 가져오는 경우.
					
				}
			}).fail(function(xhr, status, err) {
				if(error) {
					error();
				}
			});
	}
	
	
	function remove(rno, callback, error) {
		console.log("remove reply..........");
		
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			success : function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
		
	}
	
	
	function update(reply, callback, error) {
		console.log("rno: " + reply.rno);
		
		$.ajax({
			type : 'put',
			url : '/replies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
		
	}
	
	
	function get(rno, callback, error) {
		
		$.get("/replies/" + rno + ".json", function(result) {
			
			if(callback) {
				callback(result);
			}
			
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});

	}
	
	
	//TIME CALCULATOR
	function displayTime(timeValue) {
		
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str= "";
		
		// 최초 작성(or 수정) 후 24시간이 지나지 않은 댓글 시간 표시
		if(gap < (1000 * 60 * 60 * 24)) {
			
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [
				(hh > 9 ? '' : '0') + hh, ':',
				(mi > 9 ? '' : '0') + mi, ':',
				(ss > 9 ? '' : '0') + ss
			].join('');

		} else {
			// 최초 작성(or 수정) 후 24시간이 지난 댓글 표시
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();
			
			return [
				yy, '/',
				(mm > 9 ? '' : '0') + mm, '/',
				(dd > 9 ? '' : '0') + dd
			].join('');
		
		}
		
	};


	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		get : get,
		displayTime : displayTime
	};


})();