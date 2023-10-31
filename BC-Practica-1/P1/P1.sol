//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.10;

contract HelloWorld {
    uint idDigits=10**16;
    struct Producto {
        uint id;
        string nombre;
    }
    Producto[] public productos;

    function sayYourProducts() public view returns (Producto[] memory) {
        return productos;
    }

    function _generarIdAleatorio(string memory _nombre) private view returns (uint _id) {
        bytes32 hash = keccak256(abi.encodePacked(_nombre));
        uint id = uint(hash);
        uint rand=id%idDigits;
        return rand;
    }


    function crearProducto(uint _id, string memory _nombre) private{
        productos.push(Producto(_id,_nombre));
    }

    function crearProductoAleatorio(string calldata _nombre) public{
        uint _randId=_generarIdAleatorio(_nombre);
        crearProducto(_randId, _nombre);
        emit NuevoProducto(productos.length - 1, _nombre, _randId);
    }

    event NuevoProducto(uint ArrayProductoID, string nombre, uint id);

    mapping (uint => address) productoAPropietario;
    mapping (address => uint) propietarioProductos;

    function Propiedad(uint productoId) public{
        productoAPropietario[productoId] = msg.sender;
        propietarioProductos[msg.sender] = propietarioProductos[msg.sender]+1;
    }

    function getProductosPorPropietario(address _propietario) external view returns (uint[] memory) {
        uint contador_resultados = 0;
        uint[] memory result = new uint[](productos.length); // Inicializa el array result
        
        for (uint contador = 0; contador < productos.length; contador++) {
            if (productoAPropietario[contador] == _propietario) {
                result[contador_resultados] = contador;
                contador_resultados++;
            }
        }
        
        // Crea un nuevo array con el tamaño correcto
        uint[] memory finalResult = new uint[](contador_resultados);
        for (uint i = 0; i < contador_resultados; i++) {
            finalResult[i] = result[i];
        }
        
        return finalResult;
    }


    function getPropietarioProductos(address _address) public view returns (uint) {
        return propietarioProductos[_address];
    }

    function getAddressForInteger(uint _value) public view returns (address) {
        return productoAPropietario[_value];
    }

    function getProductosLength() public view returns (uint){
        return productos.length;
    }

}
