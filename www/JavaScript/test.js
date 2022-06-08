$( document ).ready(function() {
 
  console.log("JQuery is ok");

  document.getElementById('feuFlore').addEventListener('click',function() {
    document.getElementById('nombreData').style.backgroundColor = 'red';
  })
});

