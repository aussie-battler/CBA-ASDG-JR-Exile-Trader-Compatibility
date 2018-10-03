/**
 * ExileClient_util_gear_getCompatibleWeaponItems
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * Modified by [FPS]kuplion - www.friendlyplayershooting.com
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_weaponClassName","_weaponConfig","_compatibleItems","_getcompatibleItems"];
_weaponClassName = _this;
_weaponConfig = configFile >> "CfgWeapons" >> _weaponClassName;
_compatibleItems = getArray (_weaponConfig >> "magazines");
/*
{
	if (isClass (_weaponConfig >> "WeaponSlotsInfo" >> _x)) then
	{
		_compatibleItems append getArray (_weaponConfig >> "WeaponSlotsInfo" >> _x >> "compatibleItems");
	};
}
forEach ["CowsSlot", "PointerSlot", "MuzzleSlot", "UnderBarrelSlot"];
*/

{
	_getcompatibleItems = [_weaponClassName] call CBA_fnc_compatibleItems;
	_compatibleItems append _getcompatibleItems;

}forEach [101,201,301,302];

{
	if !(_x isEqualTo "this") then
	{
		_compatibleItems append getArray (_weaponConfig >> _x >> "magazines");
	};
}
forEach getArray (_weaponConfig >> "muzzles");
{
	_compatibleItems set [_forEachIndex, toLower _x];
}
forEach _compatibleItems;
_compatibleItems