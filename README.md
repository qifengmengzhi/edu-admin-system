
# 教育后台管理系统

> 面向培训机构的一体化后台管理平台，基于 Spring Boot 2.x + MyBatis 技术栈构建
>
**在线演示**：http://47.108.168.158 （账号：admin / 123456）

**技术栈**：Java 17 / Spring Boot / MyBatis / MySQL / JWT / BCrypt / 阿里云 OSS / EasyExcel / Docker
## ✨ 功能模块

### 核心业务

| 模块 | 功能描述 |
|------|----------|
| 🏢 **员工管理** | 员工信息管理、分页条件筛选、excel数据导出 |
| 👥 **部门管理** | 部门的增删改操作 |
| 👨‍🎓 **学员管理** | 基础信息维护、班级关联 |
| 📚 **班级管理** | 班级人数统计、讲师绑定、学员管理 |
| 📊 **数据统计** | 员工职位/学员学历等数据统计可视化图表 |
| 📝 **日志管理** | AOP记录操作日志,便于异常排查 |


### 技术亮点

| 分类 | 说明 |
|------|------|
| 身份认证 | JWT 无状态认证，Token 存用户信息 |
| 密码加密 | BCrypt 内置随机盐，相同密码密文不同，防彩虹表 |
| 用户透传 | ThreadLocal 存储当前用户信息，请求结束自动清理 |
| 文件存储 | 阿里云 OSS（自定义 Starter 封装） |
| 数据导出 | EasyExcel（数字自动转中文） |
| 异常处理 | 全局异常统一响应格式 |

## 部署与环境

- **操作系统**：CentOS
- **容器化**：Docker + Docker Compose
- **部署架构**：
  - MySQL 8.0 运行在 Docker 容器中
  - 后端：基于 JDK 17 自定义镜像，Spring Boot 应用以 JAR 包形式运行
  - 前端：Vue 打包为静态文件，由 Nginx 1.20.2 容器托管
  - 使用 `docker-compose` 编排所有服务
## 项目结构

```
edu-admin-backend/
├── tlias-parent/          # 父工程（依赖管理）
├── tlias-pojo/            # 实体类,DTO,VO
├── tlias-utils/           # 工具类模块
├── tlias/                 # 主应用模块
│  ├── controller/    # REST API控制层
│  ├── service/       # 业务逻辑层
│  ├── mapper/        # 数据访问层
│  ├── config/        # 配置类
│  ├── filter/        # 过滤器(JWT认证)
│  ├── intercepter/   # 拦截器
│  ├── aop/           # AOP切面(操作日志)
│  └── exception/     # 异常处理
├── aliyun-oss-spring-boot-autoconfigure/  # OSS自动配置
└── aliyun-oss-spring-boot-starter/        # OSS Starter
```

## 快速开始

### 环境要求

- JDK 17+
- MySQL 8.0+
- Maven 3.8+

### 运行步骤

1. **克隆项目**
```bash
git clone <repository-url>
cd edu-admin-backend
```

2. **创建数据库**
```sql
CREATE DATABASE IF NOT EXISTS edu_manage DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

3. **导入数据库脚本**
```bash
mysql -u username -p edu_manage < edu_manage.sql
```

4. **配置数据库连接**

修改 `tlias/src/main/resources/application.yml`：
```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/edu_manage?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai
    username: your_username
    password: your_password
```

5. **配置阿里云OSS（可选）**

如需使用文件上传功能，配置OSS参数：
```yaml
aliyun:
  oss:
    endpoint: your_endpoint
    access-key-id: your_access_key
    access-key-secret: your_secret_key
    bucket-name: your_bucket_name
```

6. **启动项目**

```bash
cd tlias
mvn spring-boot:run
```

7. **访问API文档**

启动后访问：http://localhost:8080/swagger-ui.html

