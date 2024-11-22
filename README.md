# Instrucciones para configurar y ejecutar el proyecto Marketplace

## 1. Clonar el repositorio:
```sh
git clone https://github.com/DanielaRuizA/MercaTodo.git.
```

## 2. Navegar al directorio del proyecto

Accede a la carpeta del proyecto con el siguiente comando:
```sh
cd Marketplace
```


## Instalar las dependencias

Ejecuta Bundler para instalar las dependencias necesarias del proyecto:
```sh
bundle install
```


## 4. Configurar la base de datos
### 4.1 Verificar configuración

Revisa el archivo config/database.yml y asegúrate de que las credenciales de la base de datos sean correctas.

### 4.2 Crear la base de datos

Ejecuta el siguiente comando para crear la base de datos:
```sh
rails db:create
```


### 4.3 Ejecutar las migraciones

Ejecuta las migraciones para crear las tablas necesarias en la base de datos:
```sh
rails db:migrate
```


### 4.4 Cargar datos iniciales

el proyecto incluye datos iniciales, ejecuta el siguiente comando:
```sh
rails db:seed
```
## 5. Configurar Active Storage

Ejecuta el comando para instalar Active Storage:

```sh
rails active_storage:install
```
## 6. Ejecutar migraciones de Active Storage

Aplica las migraciones generadas por Active Storage con el siguiente comando:
```sh
rails db:migrate
```


## 7.  Ejecutar el servidor

Inicia el servidor para probar el proyecto:
```sh
rails server
```

