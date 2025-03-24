# Learn-Crystal

## Project Description
This project is a simple API server built with the Crystal programming language. The purpose of this project is to demonstrate how to create a basic API server using Crystal, including handling HTTP requests, serializing JSON data, and managing sample data.

## Installation Instructions
1. **Dependencies**: Ensure you have Crystal installed on your system. You can download and install Crystal from the official website: https://crystal-lang.org/install/
2. **Clone the repository**: 
   ```sh
   git clone https://github.com/Zxce3/Learn-Crystal.git
   cd Learn-Crystal
   ```
3. **Install dependencies**:
   ```sh
   shards install
   ```

## Usage Examples
1. **Run the server**:
   ```sh
   crystal run src/api.cr
   ```
   The server will start running at `http://localhost:3000`.

2. **Make API requests**:
   - Get all users:
     ```sh
     curl http://localhost:3000/api/users
     ```
   - Get a user by ID:
     ```sh
     curl http://localhost:3000/api/users/1
     ```

## API Endpoints
- **GET /api/users**: Returns a list of all users.
- **GET /api/users/:id**: Returns a user with the specified ID.

## Authors and Contributors
- Zxce3
