from flask import Flask, jsonify, request, send_file
import pyodbc
import pandas as pd
import json
import os

app = Flask(__name__)

DB_SERVER = ''
DB_NAME = ''
DB_USERNAME = ''
DB_PASSWORD = ''
CONNECTION_STRING = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={DB_SERVER};DATABASE={DB_NAME};UID={DB_USERNAME};PWD={DB_PASSWORD}'

@app.route('/exportar_datos', methods=['GET'])
def exportar_datos():
    try:
        conn = pyodbc.connect(CONNECTION_STRING)
        
        query = "SELECT * FROM fact.Sales"
        
        df = pd.read_sql(query, conn)

        if 'SalesDate' in df.columns:
            df['SalesDate'] = pd.to_datetime(df['SalesDate'], errors='coerce')
            if pd.api.types.is_datetime64_any_dtype(df['SalesDate']):
                df['SalesDate'] = df['SalesDate'].dt.strftime('%Y-%m-%d') 
        
        file_path = os.path.join(os.getcwd(), 'datos_exportados.json')
        
        df.to_json(file_path, orient='records')
        

        if not os.path.exists(file_path):
            return jsonify({"error": "El archivo JSON no fue creado correctamente."})
        
        return send_file(file_path, as_attachment=True)
    
    except Exception as e:
        return jsonify({"error": str(e)})

if __name__ == '__main__':
    app.run(debug=True)