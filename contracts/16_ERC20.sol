pragma solidity >=0.8.2 <0.9.0;
import "./15_IERC20.sol";

abstract contract ERC20 is IToken20{

    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;
    string private _name;
    string private _symbol;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function name() public view virtual returns (string memory) {
        return _name;
    }

    function symbol() public view virtual returns (string memory) {
        return _symbol;
    }

    function decimals() public view virtual returns(uint) {
        return 18;
    }

    //virtual override --> Te sobreescribo pero permito que mis hijos puedan volver a sobreescribir
    function totalSupply() public view override returns (uint) {
        return _totalSupply;
    }

    function balanceOf(address account) external view override returns (uint256) {
        return _balances[account];
    }

    function transfer (address to, uint256 amount) external override returns (bool) { 
        address from = msg.sender;

    require(to != address(0), "ERC20: To incorrecto");
    
    uint256 balancefrom_balances[from];
    require(balanceFrom >= amount, "ERC20: Su balance debe ser mayor o igual a amount");
    _balances[from] = balanceFrom - amount;

    //sumar a la cuenta TO
    _balances[to] += amount;
    emit Transfer (from, to, amount);
    return true;
	
}
