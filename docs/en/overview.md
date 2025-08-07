## Documentation

### Introduction to the `instant_crud` Project

`instant_crud` is a **robust framework or library** meticulously designed with the primary goal of **simplifying and drastically accelerating the development of CRUD (Create, Read, Update, Delete) operations**. Its main focus lies in the **rapid and efficient construction of web APIs**. Thanks to its **highly modular architecture**, `instant_crud` provides a **complete and cohesive set of reusable components** covering critical and fundamental functionalities for any modern application, such as **authentication**, **data management**, **endpoint routing**, and **sophisticated centralized error handling**. This modularity not only ensures code reusability but also contributes to a clean and maintainable architecture.

The core objective of `instant_crud` is to **optimize and speed up the CRUD development process**, including the **management of complex relationships, especially many-to-many**. This is achieved through a modular architecture and specific components designed to abstract complexity and automate much of the repetitive work typically associated with such tasks.

### Key Features and Core Architectural Principles

The main features of `instant_crud` are at the heart of its value, offering concrete solutions to common challenges in API development:

* **1. Rapid Generation of CRUD APIs**  
  `instant_crud` is optimized to allow developers to **quickly create fully functional CRUD endpoints with minimal boilerplate code**. This is made possible by strategic components like `crud_router.py` and `base_service.py`, which **significantly reduce the development time** required for implementing standard data management interfaces.
  * **`crud_router.py`**: A **generic router class** capable of automatically exposing standard CRUD endpoints for any provided data model. Instead of manually writing routes, developers can generate them automatically.
    * *Example*: Instantiating `CRUDRouter(model=User, service=UserService)` automatically generates:
      * `GET /users` (list all users)
      * `GET /users/{id}` (get user by ID)
      * `POST /users` (create new user)
      * `PUT /users/{id}` (update user)
      * `DELETE /users/{id}` (delete user)
  * **`base_service.py`**: A **base service class** encapsulating common business logic operations. These services often interact with `BaseRepository`, abstracting CRUD logic from the routing layer to keep the code clean and modular.

* **2. Comprehensive Authentication and Authorization**  
  `instant_crud` offers **built-in support for modern security paradigms**, ensuring secure access control.
  * **JWT-based Authentication**: Stateless session management using JSON Web Tokens. The `jwt_handler.py` module handles **token creation, encoding, decoding, and validation**.
  * **Role-Based Access Control (RBAC)**: Provides **granular user permission management**. The `role_checker.py` module implements the RBAC logic, verifying user permissions.
  * The `instant_crud/auth/` module includes decorators such as `@jwt_required` and `@roles_required(["admin", "editor"])` to easily enforce security controls on API endpoints.

* **3. Flexible and Abstracted Data Access Layer**  
  The framework is **database-agnostic**, compatible with different persistence technologies via well-defined repository interfaces:
  * **`base_repository.py` and `repository_interfaces.py`** define the base repository contract.
  * Implementations include:
    * **SQLAlchemy** (PostgreSQL, MySQL, SQLite)
    * **DuckDB** for **in-process analytical queries**, ideal for fast data analysis without external DB servers.

* **4. Advanced Data Filtering Capabilities**  
  `instant_crud` supports **complex filtering via a JSON-based query language**, enabling flexible and dynamic data retrieval through the `instant_crud/filters/` module.
  * *Example*: `?filter={"name":{"$eq":"Alice"},"age":{"$gt":25}}` is parsed and translated into a valid DB query. Supported operators include `$eq`, `$ne`, `$gt`, `$in`, `$contains`.

* **5. Native Support for Many-to-Many Relationships**  
  The framework provides **first-class support and helpers** for seamless many-to-many relationship handling:
  * **`many_to_many_decorator.py`**: Automates join table operations.
  * **`many_to_many_router.py`**: Specialized router for **linking/unlinking entities**.
    * *Example*: `POST /users/{user_id}/roles/{role_id}` to assign, `DELETE` to remove.
  * **`many_to_many_service.py`**: Encapsulates the **business logic** for maintaining data integrity in many-to-many operations.

* **6. Centralized and Granular Error Management**  
  `instant_crud` includes a **robust error handling system** via the `instant_crud/errors/` module:
  * Categorizes, manages, and propagates application errors consistently.
  * *Example*: `RepositoryNotFoundError` becomes a `404 Not Found` HTTP response. Error codes (e.g., `ERROR_CODE_AUTH_INVALID_CREDENTIALS = 1001`) facilitate client-side error handling.

* **7. Integrated Pagination**  
  The `instant_crud/response/pagination.py` module provides utilities and data structures for **efficiently paginating API responses**:
  * Converts item lists and counts into structured pagination responses.
  * *Example*: Includes `items`, `total`, `page`, and `page_size` fields.

### Detailed Project Structure and Module Breakdown

The `instant_crud` project follows a **clean, modular structure**, with each module encapsulating specific responsibilities to enhance clarity and maintainability. The full breakdown of modules and their responsibilities is available in the documentation and mirrors the Italian structure previously provided.

### Conclusion

In summary, `instant_crud` emerges as a **complete and well-structured framework**, whose modular design and smart use of reusable components are aimed at **drastically optimizing and accelerating the development of CRUD operations**. Not only does it facilitate the creation of standard APIs, but it also provides **robust support for complex relationships (particularly many-to-many)**, **JWT and RBAC-based authentication**, **flexible and database-agnostic data persistence**, and a **centralized and granular error management system**. By abstracting underlying complexities and automating much of the repetitive work, `instant_crud` enables developers to focus on their application’s unique business logic, **significantly reducing development time** and improving code quality.
