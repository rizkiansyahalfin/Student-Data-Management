# Student Data Management System

A comprehensive web-based student data management system built with Ruby on Rails. This application provides a complete solution for managing student information, academic programs, and administrative data for educational institutions.

## 🚀 Features

### Core Functionality
- **Student Management**: Complete CRUD operations for student records
- **Academic Program Management**: Manage study programs (Jurusan) and classes (Rombel)
- **Regional Management**: Organize students by regions (Rayon)
- **User Authentication**: Secure login system with Devise
- **Role-based Access Control**: Menu permissions system for different user roles
- **Data Import/Export**: Excel and CSV file support for bulk operations
- **Advanced Search & Filtering**: Ransack-powered search functionality
- **Responsive Data Tables**: Interactive tables with sorting and pagination

### Technical Features
- **Modern UI**: Bootstrap 4 responsive design
- **Data Tables**: jQuery DataTables integration
- **File Processing**: Support for Excel (.xlsx, .xls) and CSV files
- **Database**: MySQL with proper relationships and constraints
- **Security**: Password encryption with BCrypt
- **API Ready**: JSON API endpoints for all resources

## 🛠️ Technology Stack

### Backend
- **Ruby**: 2.7.0
- **Rails**: 6.0.2+
- **Database**: MySQL
- **Authentication**: Devise
- **File Processing**: Roo, Axlsx
- **Search**: Ransack
- **Pagination**: Kaminari

### Frontend
- **CSS Framework**: Bootstrap 4
- **JavaScript**: jQuery, DataTables
- **Build Tool**: Webpacker
- **Styling**: SCSS

### Development Tools
- **Testing**: Capybara, Selenium WebDriver
- **Development Server**: Puma
- **Code Quality**: Byebug for debugging

## 📋 Prerequisites

Before running this application, make sure you have the following installed:

- Ruby 2.7.0
- Rails 6.0.2+
- MySQL 5.7+
- Node.js 12+
- Yarn

## 🚀 Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd Student-Data-Management
   ```

2. **Install Ruby dependencies**
   ```bash
   bundle install
   ```

3. **Install JavaScript dependencies**
   ```bash
   yarn install
   ```

4. **Database setup**
   ```bash
   # Create database
   rails db:create
   
   # Run migrations
   rails db:migrate
   
   # Seed initial data (optional)
   rails db:seed
   ```

5. **Start the application**
   ```bash
   rails server
   ```

6. **Access the application**
   Open your browser and navigate to `http://localhost:3000`

## 📊 Database Schema

### Core Entities

#### Students (Siswas)
- `nama` - Student name
- `jk` - Gender
- `rombel_id` - Class reference
- `rayon_id` - Region reference

#### Academic Programs (Jurusans)
- `jurusan` - Program name
- Related to multiple classes (Rombels)

#### Classes (Rombels)
- `rombel` - Class name
- `jurusan_id` - Program reference

#### Regions (Rayons)
- `rayon` - Region name

#### Users
- Email-based authentication
- Role-based permissions system

#### Menu Permissions
- Granular access control
- CRUD permissions per menu item

## 🔧 Configuration

### Environment Variables
Create a `.env` file in the root directory:

```env
DATABASE_URL=mysql2://username:password@localhost/student_data_development
SECRET_KEY_BASE=your_secret_key_here
```

### Database Configuration
Update `config/database.yml` with your MySQL credentials:

```yaml
development:
  adapter: mysql2
  encoding: utf8mb4
  database: student_data_development
  username: your_username
  password: your_password
  host: localhost
```

## 📁 Project Structure

```
app/
├── controllers/          # Application controllers
├── models/              # Data models and business logic
├── views/               # ERB templates
├── assets/              # CSS, JavaScript, and images
├── datatables/          # DataTable configurations
└── helpers/             # View helpers

config/
├── routes.rb            # Application routes
├── database.yml         # Database configuration
└── application.rb       # Application settings

db/
├── migrate/             # Database migrations
├── schema.rb            # Database schema
└── seeds.rb             # Seed data
```

## 🎯 Usage

### Student Management
1. Navigate to the Students section
2. Use the "New Student" button to add students
3. Import bulk data using Excel/CSV files
4. Search and filter students using the data table
5. Export data to Excel format

### Academic Program Setup
1. Create study programs (Jurusan)
2. Set up classes (Rombel) for each program
3. Organize students by regions (Rayon)

### User Management
1. Register new users through the authentication system
2. Configure menu permissions for role-based access
3. Manage user access to different features

## 🔒 Security Features

- **Password Encryption**: BCrypt for secure password storage
- **Authentication**: Devise-based user authentication
- **Authorization**: Menu-based permission system
- **Data Validation**: Model-level validations
- **SQL Injection Protection**: ActiveRecord ORM protection

## 📈 Performance Features

- **Database Indexing**: Optimized queries with proper indexes
- **Pagination**: Kaminari for efficient data loading
- **Caching**: Rails caching mechanisms
- **Asset Optimization**: Webpacker for efficient asset compilation

## 🧪 Testing

Run the test suite:

```bash
# Run all tests
rails test

# Run specific test files
rails test test/models/siswa_test.rb

# Run system tests
rails test:system
```

## 📦 Deployment

### Production Setup

1. **Environment Configuration**
   ```bash
   RAILS_ENV=production bundle install
   ```

2. **Database Setup**
   ```bash
   RAILS_ENV=production rails db:create
   RAILS_ENV=production rails db:migrate
   ```

3. **Asset Compilation**
   ```bash
   RAILS_ENV=production rails assets:precompile
   ```

4. **Start Production Server**
   ```bash
   RAILS_ENV=production rails server
   ```

### Docker Deployment (Optional)
```dockerfile
FROM ruby:2.7.0
# Add Dockerfile configuration here
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- **Rizki Ansyah Alfin** - *Initial work* - [rizkiansyahalfin](https://github.com/rizkiansyahalfin)

## 🙏 Acknowledgments

- Rails community for the excellent framework
- Bootstrap team for the UI framework
- Devise team for authentication
- All contributors and testers

## 📞 Support

For support and questions:
- Create an issue in the repository
- Contact: rizkiansyahalfin030603@gmail.com

## 🔄 Version History

- **v1.0.0** - Initial release with core functionality
- **v1.1.0** - Added import/export features
- **v1.2.0** - Enhanced UI with DataTables
- **v1.3.0** - Added role-based permissions

---

**Note**: This application is designed for educational institutions and requires proper database setup and user configuration before use in production environments.