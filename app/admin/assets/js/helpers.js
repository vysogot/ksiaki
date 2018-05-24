function set_button(myFunc, myIndex, myRow, myTitle, myIcon, myDisable) {
  return '<a href="#" onclick="' + myFunc + '"' +
    ' data-index=' + myIndex +
    ' data-id=' + myRow.id +
    ' data-name=' + myRow.name +
    ' data-slug=' + myRow.slug +
    ' title="' + myTitle + '"' + myDisable +
    '><i class="fas ' + myIcon + '"></i>'  + '</a>';
 }
 
