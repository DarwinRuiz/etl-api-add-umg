# 🛠 Exporting Data from SQL Server to JSON

This project is a RESTful API built with **Flask** that allows exporting data from a table in **SQL Server** to a **JSON** file.

## 📋 Requirements

- 🐍 Python 3.x
- 🚀 Flask
- 📊 Pandas
- 🗄️ pyodbc
- ODBC Driver for SQL Server

## 🔧 Installation

1. **Clone the repository**:

   ```bash
   git clone <REPOSITORY_URL>
   cd <REPOSITORY_NAME>
   ```

2. **Create a virtual environment** (optional but recommended):

   ```bash
   python -m venv venv
   source venv/bin/activate  
   # On Windows use `venv\Scripts\activate`
   ```

3. **Install the dependencies**:

   You can install the dependencies using the `requirements.txt` file:

   ```bash
   pip install -r requirements.txt
   ```

   Alternatively, you can install them individually:

   ```bash
   pip install Flask pandas pyodbc
   ```

4. **Install the ODBC Driver 17** for SQL Server. You can download it from [here](https://docs.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server).

## 🗂️ Project Structure

The project contains the following folder structure:

```
<repository_name>/
├── src/
│   ├── main.py
├── requirements.txt
├── data/
│   ├── script_create_table.sql
│   ├── script_insert_data.sql
└── README.md
```

- **data/**: Folder that contains the necessary database scripts to create the table \`fact.Sales\`.

## ⚙️ Configuration

Edit the \`main.py\` file to update the connection parameters for your database:

```python
DB_SERVER = ''
DB_NAME = ''
DB_USERNAME = ''
DB_PASSWORD = ''
```

## 🚀 Usage

To run the application, use the following command:

```bash
python src/main.py
```

The application will be available at \`http://127.0.0.1:5000\`.

### 📡 Endpoint

- **\`GET /exportar_datos\`**: Exports the data from the \`fact.Sales\` table in JSON format. The file will be automatically downloaded.

## 📄 Example Response

If the export is successful, the JSON file will have the following format:

```json
[
    {
        "SalesID": 1,
        "SalesDate": "2024-01-01",
        "Amount": 100.00
    },
    {
        "SalesID": 2,
        "SalesDate": "2024-01-02",
        "Amount": 150.00
    }
]
```

## ⚠️ Errors

If there is a problem creating the JSON file, an error message will be returned in JSON format:

```json
{
    "error": "Error description"
}
```

---

# 🛠 Exportar Datos de SQL Server a JSON

Este proyecto es una API RESTful construida con **Flask** que permite exportar datos de una tabla en **SQL Server** a un archivo **JSON**.

## 📋 Requisitos

- 🐍 Python 3.x
- 🚀 Flask
- 📊 Pandas
- 🗄️ pyodbc
- ODBC Driver para SQL Server

## 🔧 Instalación

1. **Clona el repositorio**:

   ```bash
   git clone <URL_DEL_REPOSITORIO>
   cd <NOMBRE_DEL_REPOSITORIO>
   ```

2. **Crea un entorno virtual** (opcional pero recomendado):

   ```bash
   python -m venv venv
   source venv/bin/activate  
   # En Windows usa `venv\Scripts\activate`
   ```

3. **Instala las dependencias**:

   Puedes instalar las dependencias usando el archivo `requirements.txt`:

   ```bash
   pip install -r requirements.txt
   ```

   Alternativamente, puedes instalarlas individualmente:

   ```bash
   pip install Flask pandas pyodbc
   ```

4. **Instala el ODBC Driver 17** para SQL Server. Puedes descargarlo desde [aquí](https://docs.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server).

## 🗂️ Estructura del Proyecto

El proyecto contiene la siguiente estructura de carpetas:

```
<nombre_del_repositorio>/
├── src/
│   ├── main.py
├── requirements.txt
├── data/
│   ├── script_crear_tabla.sql
│   ├── script_insertar_datos.sql
└── README.md
```

- **data/**: Carpeta que contiene los scripts de base de datos necesarios para crear la tabla \`fact.Sales\`.

## ⚙️ Configuración

Edita el archivo \`main.py\` para actualizar los parámetros de conexión a tu base de datos:

```python
DB_SERVER = ''
DB_NAME = ''
DB_USERNAME = ''
DB_PASSWORD = ''
```

## 🚀 Uso

Para ejecutar la aplicación, utiliza el siguiente comando:

```bash
python src/main.py
```

La aplicación estará disponible en \`http://127.0.0.1:5000\`.

### 📡 Endpoint

- **\`GET /exportar_datos\`**: Exporta los datos de la tabla \`fact.Sales\` en formato JSON. El archivo se descargará automáticamente.

## 📄 Ejemplo de Respuesta

Si la exportación es exitosa, el archivo JSON tendrá el siguiente formato:

```json
[
    {
        "SalesID": 1,
        "SalesDate": "2024-01-01",
        "Amount": 100.00
    },
    {
        "SalesID": 2,
        "SalesDate": "2024-01-02",
        "Amount": 150.00
    }
]
```

## ⚠️ Errores

Si hay un problema al crear el archivo JSON, se devolverá un mensaje de error en formato JSON:

```json
{
    "error": "Descripción del error"
}
```
