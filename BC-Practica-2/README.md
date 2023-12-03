Práctica 2 BC - MUNICS

Ejercicio 1:
Para llevar a cabo la práctica se han llevado a cabo los siguientes comandos:
> docker run -d --name ipfs_host -v ${PWD}:/export -v ${PWD}:/data/ipfs -p 4001:4001 -p 4001:4001/udp -p 127.0.0.1:8080:8080 -p 127.0.0.1:5001:5001 ipfs/kubo

> docker exec ipfs_host ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin '[\"http://0.0.0.0:5001\", \"http://localhost:3000\", \"http://127.0.0.1:5001\", \"https://webui.ipfs.io\"]'

> docker exec ipfs_host ipfs config --json API.HTTPHeaders.Access-Control-Allow-Methods '[\"PUT\", \"POST\"]'

Con esto se crea un container host para ipfs.
![connected_to_ipfs](https://github.com/luiscorbachoflores/blockchain-munics/assets/92652221/95cdf4d7-360e-4f15-a292-5d35dcc0f817)
![docker](https://github.com/luiscorbachoflores/blockchain-munics/assets/92652221/4177162f-f3eb-41b2-97b1-b39a71ad76e5)


A continuación se modifica el archivo src/contracts/addresses.js con la dirección del contrato previamente desplegado en REMIX. En este caso, con la dirección 0xd194ECa6e95a238F7017787a38b3FC05873D0dF.
Por último, se crea un frontend en node utilizando los códigos fuente incluidos en el repositorio y se sube un fichero.
![uploading file](https://github.com/luiscorbachoflores/blockchain-munics/assets/92652221/d58bd126-6fa3-40a6-9573-2c3d50c6bb28)

Finalmente podemos ver como el fichero ha sido subido a IPFS
![file uploaded](https://github.com/luiscorbachoflores/blockchain-munics/assets/92652221/670bc2a5-9db9-4471-931a-f9b986606012)

Ejercicio 2:
El ejercicio 2 se ha subido a https://github.com/pedrotega/munics/tree/main/BC/Lab2/Ej2
