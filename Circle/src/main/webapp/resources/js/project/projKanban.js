function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev, el) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    el.appendChild(document.getElementById(data));
}

function newtask(el) {
	var taskArray = [];
	var matches = document.getElementsByClassName("divtask");
	for (var i = 0, l = matches.length; i < l; i++) 
		taskArray.push(matches[i].getAttribute("id"));
	
	if( taskArray.length ) {
		var nexttask = Math.max.apply(null, taskArray) + 1;
	} else {
		var nexttask = 1;
	}
	
	var newDiv = document.createElement("div");	
	newDiv.id = nexttask;
	newDiv.className = 'divtask';
	newDiv.draggable = 'true';
	newDiv.addEventListener('dragstart', function() {drag(event)}, false);
	
	var tasktitle = document.createElement('P');
	var t = document.createTextNode("Task title");
	tasktitle.appendChild(t);     
	tasktitle.className = 'taskheader';
	tasktitle.contentEditable = "true";
	newDiv.appendChild(tasktitle);

	var taskcontent = document.createElement('P');
	var t = document.createTextNode("Task description");
	taskcontent.appendChild(t);     
	taskcontent.className = 'taskcontent';
	taskcontent.contentEditable = "true";
	newDiv.appendChild(taskcontent);
	
	var tasklink = document.createElement('P');
	var t = document.createTextNode("Task owner");
	tasklink.appendChild(t);     
	tasklink.className = 'tasklink';
	tasklink.contentEditable = "true";
	newDiv.appendChild(tasklink);
	
	document.getElementsByTagName('div')[3].appendChild(newDiv);
}

function deletediv(ev) {
    ev.preventDefault();
	var data=ev.dataTransfer.getData("text");
	var ev = document.getElementById(data);
	
	var bintest = confirm("Archive this task?");
		if (bintest == true) {
			ev.parentNode.removeChild(ev);
		} else {
	}
}