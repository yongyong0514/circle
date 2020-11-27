
const selected = document.querySelector(".selected");
const optionsContainer = document.querySelector(".options-container");

const optionsList = document.querySelectorAll(".option");

selected.addEventListener("click", () => {
  optionsContainer.classList.toggle("active");
});

optionsList.forEach(o => {
  o.addEventListener("click", () => {
    selected.innerHTML = o.querySelector("label").innerHTML;
    optionsContainer.classList.remove("active");
  });
});

function validate(){
	  var name = document.getElementById("name").value;
	  var subject = document.getElementById("subject").value;
	  var phone = document.getElementById("phone").value;
	  var email = document.getElementById("email").value;
	  var message = document.getElementById("message").value;
	  var error_message = document.getElementById("error_message");
	  
	  error_message.style.padding = "10px";
	  
	  var text;
	  if(post_title.length < 0){
	    text = "Please Enter valid Name";
	    error_message.innerHTML = text;
	    return false;
	  }	  if(post_comt.length <= 0){
	    text = "Please Enter More Than 140 Characters";
	    error_message.innerHTML = text;
	    return false;
	  }
	  alert("Form Submitted Successfully!");
	  return true;
	}
	
	
	