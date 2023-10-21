import Text "mo:base/Text";
import Http "mo:base/Http";

import type { Text } from "mo:base/Text";
import type { Principal } from "mo:base/Principal";

// Definir un registro para almacenar los datos del usuario
type User = {
  nombre: Text;
  apellido: Text;
  dir: Text;
  tel: Text;
  correo: Text;
  contrasenia: Text;
  info: Text;
};

// Definir una tabla para almacenar los usuarios
table users : [Text] -> User;

// Función para almacenar los datos del usuario en la base de datos
public func storeUser(nombre: Text, apellido: Text, dir: Text, tel: Text, correo: Text, contrasenia: Text, info: Text) : async () {
  let user : User = {
    nombre = nombre;
    apellido = apellido;
    dir = dir;
    tel = tel;
    correo = correo;
    contrasenia = contrasenia;
    info = info;
  };
  users.put(correo, user);
}

// Función para obtener todos los usuarios almacenados en la base de datos
public query func getUsers() : async [User] {
  var userList : [User] = [];
  for (user in users) {
    userList := userList # [user];
  }
  userList;
}

actor fireguard_backend {
  public func handleRequest(request: Http.Request) : async Http.Response {
    switch (request.method) {
      case (Http.Method.POST) {
        let body = await request.body.text();
        let }
    }
  }
}
