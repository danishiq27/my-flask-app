from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_login import LoginManager
from config import Config
import pymysql

db = SQLAlchemy()
migrate = Migrate()
login = LoginManager()
login.login_view = 'login'

def create_app(config_class=Config):
    app = Flask(__name__, static_folder='static')
    app.config.from_object(config_class)

   # Configure SQLAlchemy to use pymysql
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://flask_user:password@localhost/flask_db'    

    db.init_app(app)
    migrate.init_app(app, db)
    login.init_app(app)

    from app import routes, models

    app.register_blueprint(routes.bp)  # Register blueprint if using blueprints

    return app
