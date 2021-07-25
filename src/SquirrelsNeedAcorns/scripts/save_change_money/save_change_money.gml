// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_change_money(_money){
/// @desc Add or remove money from player
/// @arg Money to add or remove

ini_open(global.saveFile);
var _addMoney = ini_read_real("stats", "money", 0);
_addMoney = _addMoney + _money;
ini_write_real("stats", "money", _addMoney);
ini_close();
}