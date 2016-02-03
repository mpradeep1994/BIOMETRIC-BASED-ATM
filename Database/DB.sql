USE [master]
GO
/****** Object:  Database [ATM]    Script Date: 02/26/2014 20:04:18 ******/
CREATE DATABASE [ATM] ON  PRIMARY 
( NAME = N'ATM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\ATM.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ATM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\ATM_log.ldf' , SIZE = 4672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO
EXEC dbo.sp_dbcmptlevel @dbname=N'ATM', @new_cmptlevel=90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ATM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ATM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ATM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ATM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ATM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ATM] SET ARITHABORT OFF 
GO
ALTER DATABASE [ATM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ATM] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ATM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ATM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ATM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ATM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ATM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ATM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ATM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ATM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ATM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ATM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ATM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ATM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ATM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ATM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ATM] SET  READ_WRITE 
GO
ALTER DATABASE [ATM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ATM] SET  MULTI_USER 
GO
ALTER DATABASE [ATM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ATM] SET DB_CHAINING OFF 