web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
abi = JSON.parse('[{"constant":true,"inputs":[],"name":"wellcomeString","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"newString","type":"string"}],"name":"SetWellcomeOne","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"}]');
WellcomeContract = web3.eth.contract(abi);
contractInstance = WellcomeContract.at('0x57e63092c859a76e10b15bb5904d2ca2b4e6c6b8');

function updateWellcomeString() {
  let val = contractInstance.wellcomeString.call().toString();
  $("#wellcomeStringContainer").html(val);
}
 
function changeWellcomeString() {
  newWellcomeString = $("#wellcomeStringInput").val();
  contractInstance.SetWellcomeOne(newWellcomeString, {from: web3.eth.accounts[0], gas:300000}, function() {
    updateWellcomeString();
  });
}
 
$(document).ready(function() {
  updateWellcomeString();
});