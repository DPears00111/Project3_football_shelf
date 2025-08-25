[README.md](https://github.com/user-attachments/files/21962451/README.md)
# Full Stack Jersey E-commerce Demo

This project is a full stack e-commerce store online that caters to all football fans, as it is only a start up we only sell jerseys but have plans to expand to a veriaty of products including customized football jerseys.

## Project Structure

```
FS_DEMO/
├── backend/         # Node.js/Express backend
├── frontend/        # Vue.js frontend
├── package.json     # Root package file
└── ...
```

### Backend
- **Location:** `backend/`
- **Languages used:** Node.js, Express, PostgreSQL
- **Key Folders:**
  - `config/` - Database configuration
  - `controllers/` - Route controllers (auth, cart, jerseys, etc.)
  - `middleware/` - Authentication middleware
  - `models/` - Database models
  - `routes/` - API route definitions
  - `utils/` - Utility functions (e.g., email sending)
  - `migrations/` - SQL migration scripts
- **Entry Point:** `backend/index.js`

### Frontend
- **Location:** `frontend/`
- **Tech:** Vue.js
- **Key Folders:**
  - `src/components/` - Vue components
  - `src/views/` - Page views
  - `src/services/` - API and business logic
  - `src/store/` - Vuex store
  - `public/` - Static assets (images, icons, etc.)
- **Entry Point:** `frontend/src/main.js`

## Setup Instructions

### Prerequisites
- Node.js (v14+ recommended)
- npm
- PostgreSQL

### Backend Setup
1. Navigate to the backend folder:
   
   cd backend
   
2. Install dependencies:
   npm install

   dependencies:
   npm install
   bcrypt
   bcryptjs
   body-parser
   cors
   dotenv
   express
   jsonwebtoken
   mysql2
   nodemailer
   nodemon

   
3. Database will be provided in a seperate dumps folder.(I exported it as i lost the updated code)

4. Start the backend server:
   
   node --watch index
   

### Frontend Setup
1. Navigate to the frontend folder:
   
   cd frontend
   
2. Install dependencies:
   npm install
   axios
   core-js
   register-service-worker
   vue
   vue-router
   vuex
   
3. Start the frontend development server:
   
   npm run serve
   

## Features
- User authentication (login, signup, password reset)
- Product browsing and filtering
- Shopping cart and checkout
- Email notifications
- Responsive design

