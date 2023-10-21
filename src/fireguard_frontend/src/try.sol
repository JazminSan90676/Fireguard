// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Declaración del contrato
contract DetectorDeIncendiosContract {
    address public owner;  // Dirección del propietario del contrato
    bool public incendioDetectado;  // Estado de detección de incendios

    // Evento para notificar a la aplicación Motoko
    event IncendioDetectado(address indexed detector);

    // Modificador para restringir el acceso a funciones específicas
    modifier soloPropietario() {
        require(msg.sender == owner, "Solo el propietario puede llamar a esta funcion");
        _;
    }

    // Constructor del contrato
    constructor() {
        owner = msg.sender;
        incendioDetectado = false;
    }

    // Función para que el detector de incendios registre la detección
    function reportarIncendio() public soloPropietario {
        incendioDetectado = true;
        emit IncendioDetectado(msg.sender);

        // Aquí podrías agregar lógica adicional, como enviar notificaciones a la aplicación Motoko.
    }

    // Función para que la aplicación Motoko consulte el estado de detección de incendios
    function estaIncendioDetectado() public view returns (bool) {
        return incendioDetectado;
    }
}