USE [master]
GO
/****** Object:  Database [EggDB]    Script Date: 3/23/2017 8:34:30 AM ******/
CREATE DATABASE [EggDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EggDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EggDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EggDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EggDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EggDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EggDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EggDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EggDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EggDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EggDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EggDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EggDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EggDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EggDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EggDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EggDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EggDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EggDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EggDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EggDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EggDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EggDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EggDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EggDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EggDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EggDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EggDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EggDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EggDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EggDB] SET  MULTI_USER 
GO
ALTER DATABASE [EggDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EggDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EggDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EggDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EggDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EggDB]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 3/23/2017 8:34:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeachnologyID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Intro] [nvarchar](max) NULL,
	[Image] [nvarchar](50) NULL,
	[MediumImage] [nvarchar](50) NULL,
	[LargeImage] [nvarchar](50) NULL,
	[IsPro] [int] NULL,
	[NumberLesson] [int] NULL,
	[NumberMinutes] [int] NULL,
	[LastUpdate] [timestamp] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 3/23/2017 8:34:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[ID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[LessonID] [int] NOT NULL,
	[IsComplete] [int] NULL,
	[TimeStart] [time](7) NULL,
	[OrderState] [int] NULL,
	[LastActive] [timestamp] NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 3/23/2017 8:34:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Intro] [nvarchar](max) NULL,
	[Google] [nvarchar](50) NULL,
	[Twitter] [nvarchar](50) NULL,
	[Facebook] [nvarchar](50) NULL,
	[Blog] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](52) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Avatar] [nvarchar](50) NULL,
	[LargeAvatar] [nvarchar](50) NULL,
	[MediumAvatar] [nvarchar](50) NULL,
	[LastUpdate] [timestamp] NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 3/23/2017 8:34:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[InstructorID] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Intro] [nvarchar](max) NULL,
	[Time] [int] NULL,
	[Video] [nvarchar](max) NULL,
	[Order] [int] NULL,
	[IsPro] [int] NULL,
	[LastUpdate] [timestamp] NULL,
 CONSTRAINT [PK_Lesson] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/23/2017 8:34:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Intro] [nvarchar](max) NULL,
	[Google] [nvarchar](50) NULL,
	[Twitter] [nvarchar](50) NULL,
	[Facebook] [nvarchar](50) NULL,
	[Blog] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](max) NULL,
	[Avatar] [nvarchar](50) NULL,
	[LargeAvatar] [nvarchar](50) NULL,
	[MediumAvatar] [nvarchar](50) NULL,
	[ExpiredProTime] [time](7) NULL,
	[LastUpdate] [timestamp] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Technology]    Script Date: 3/23/2017 8:34:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Technology](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Intro] [nvarchar](max) NULL,
	[Image] [nvarchar](50) NULL,
	[MediumImage] [nvarchar](50) NULL,
	[LargeImage] [nvarchar](50) NULL,
	[NumberCourses] [int] NULL,
	[NumberLessons] [int] NULL,
	[LastUpdate] [timestamp] NULL,
 CONSTRAINT [PK_Technology] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([ID], [TeachnologyID], [Name], [Intro], [Image], [MediumImage], [LargeImage], [IsPro], [NumberLesson], [NumberMinutes]) VALUES (1, 1, N'Start Using React to Build Web Applications', N'"React is a ""javascript library for building user interfaces"" from the fine folks at Facebook & Instagram. It strictly focuses on the ""V"" in your MVC applications, and touts a blazing fast virtual DOM diff implementation.

This series will explore the basic fundamentals of React to get you started.

When you''ve finished with this series, be sure to check out React Flux Architecture for real-world React application development."', NULL, NULL, NULL, NULL, 21, 66)
INSERT [dbo].[Course] ([ID], [TeachnologyID], [Name], [Intro], [Image], [MediumImage], [LargeImage], [IsPro], [NumberLesson], [NumberMinutes]) VALUES (3, 1, N'Build Your First Production Quality React App', N'"With the variety of choice we have in building modern web applications using JavaScript, it can make it difficult to understand where to even begin. We live in a wondrous era, where every problem we have seems to have a corresponding javascript module on npm that we can install with just a few keystrokes. It’s easy!

Often, “easy” can mean the opposite of simple. Easy is “quick to do”, where simple is “quick to understand”.

KISS.

In this course you will learn how to build production quality React applications. We will strive to keep things as simple as possible, with minimal dependencies. Instead of typing npm install, we will build our own simple solutions first, to get a solid understanding of the problems that we are solving through libraries. We will build our tools in a functional style, and write appropriate unit tests to verify that they work as expected.

If you are brand new to React, you’ll want to read the documentation and watch our free React Fundamentals course."', NULL, NULL, NULL, NULL, 24, 111)
INSERT [dbo].[Course] ([ID], [TeachnologyID], [Name], [Intro], [Image], [MediumImage], [LargeImage], [IsPro], [NumberLesson], [NumberMinutes]) VALUES (4, 1, N'Getting Started with Redux', N'"Managing state in an application is critical, and is often done haphazardly. Redux provides a state container for JavaScript applications that will help your applications behave consistently.

Redux is an evolution of the ideas presented by Facebook''s Flux, avoiding the complexity found in Flux by looking to how applications are built with the Elm language.

Redux is useful for React applications, but React is not a requirement!

In this series, we will learn the basics of Redux, so that you can start using it to simplify your applications.

It''s highly recommended that you have a quick read of the Redux documentation alongside or before you watch the series.

There are some amazing community notes on this course here on Github.

Once you are finished with this course be sure to check out part 2: building-react-applications-with-idiomatic-redux"', NULL, NULL, NULL, NULL, 30, 121)
INSERT [dbo].[Course] ([ID], [TeachnologyID], [Name], [Intro], [Image], [MediumImage], [LargeImage], [IsPro], [NumberLesson], [NumberMinutes]) VALUES (5, 2, N'Learn ES6 (ECMAScript 2015)', N'This course takes a look at some of the new features that JavaScript has available with ES6 (ECMAScript 2015). It is a "montage" from several instructors.', NULL, NULL, NULL, NULL, 16, 53)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Instructor] ON 

INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [Google], [Twitter], [Facebook], [Blog], [Email], [Password], [Phone], [Address], [Avatar], [LargeAvatar], [MediumAvatar]) VALUES (3, NULL, N'Craig ', N'McKeachie', N'Craig McKeachie has been a software developer for 15 years and earned the Microsoft Certified Solutions Developer (MCSD) certification for three generations of Microsoft technology. Craig is the author of the JavaScript Framework Guide: AngularJS, Backbone, and Ember and blogs at funnyant.com.', N'https://plus.google.com/+CraigMcKeachie?rel=author', N'https://twitter.com/cmckeachie', NULL, N'http://www.funnyant.com/', N'CraigMcKeachie@gmail.com', N'12345678@', N'012345678', NULL, NULL, NULL, NULL)
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [Google], [Twitter], [Facebook], [Blog], [Email], [Password], [Phone], [Address], [Avatar], [LargeAvatar], [MediumAvatar]) VALUES (5, NULL, N'Preethi ', N'Kasireddy', N'A passionate software engineer that loves teaching others everything I learn. In my previous life, I was a venture capitalist at Andreessen Horowitz, where I fell in love with passionate engineers & entrepreneurs and realized I wanted to be "one of them" :)', NULL, N'https://twitter.com/iam_preethi', NULL, N'https://medium.com/@preethikasireddy', N'Kasireddy@gmail.com', N'12345678@', N'012345678', NULL, NULL, NULL, NULL)
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [Google], [Twitter], [Facebook], [Blog], [Email], [Password], [Phone], [Address], [Avatar], [LargeAvatar], [MediumAvatar]) VALUES (6, NULL, N'Joe ', N'Maddalone', N'Joe is a father of five, lives in Chicago, works as a freelance web developer, shares coding tutorials on egghead.io, and codes for fun when not for work.', N'https://plus.google.com/+JoeMaddalone?rel=author', N'https://twitter.com/joemaddalone', NULL, N'http://www.joemaddalone.com/', N'Maddalone@gmail.com', N'12345678@', N'012345678', NULL, NULL, NULL, NULL)
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [Google], [Twitter], [Facebook], [Blog], [Email], [Password], [Phone], [Address], [Avatar], [LargeAvatar], [MediumAvatar]) VALUES (7, NULL, N'Andrew ', N'Van Slaars', N'Full stack developer, currently focused on building applications with JavaScript. I love learning new libraries, languages and tools and I''m passionate about sharing the things I learn with others.', NULL, N'https://twitter.com/avanslaars', NULL, N'http://vanslaars.io/', N'AndrewVanSlaars@gmail.com', N'12345678@', N'012345678', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Instructor] OFF
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([ID], [CourseID], [InstructorID], [Name], [Intro], [Time], [Video], [Order], [IsPro]) VALUES (1, 1, 6, N'Use create-react-app to Setup a Simple React App', N'

This lessons goes over what it takes to get React to output simple text to the browser such as Hello Eggheads. This lesson will also introduce stateless functional components. React uses JSX which is a "JavaScript syntax extension that looks similar to XML." While this is not required to use with React, it is highly recommended.', 165, N'https://egghead.io/lessons/react-react-fundamentals-development-environment-setup', NULL, NULL)
INSERT [dbo].[Lesson] ([ID], [CourseID], [InstructorID], [Name], [Intro], [Time], [Video], [Order], [IsPro]) VALUES (3, 1, 6, N'Write a "Hello World" React Component', N'This lessons goes over what it takes to get React to output simple text to the browser such as Hello Eggheads. This lesson will also introduce stateless functional components. React uses JSX which is a "JavaScript syntax extension that looks similar to XML." While this is not required to use with React, it is highly recommended.', 165, N'https://egghead.io/lessons/react-hello-world-first-component', NULL, NULL)
INSERT [dbo].[Lesson] ([ID], [CourseID], [InstructorID], [Name], [Intro], [Time], [Video], [Order], [IsPro]) VALUES (8, 3, 7, N'Bootstrap a React Application through the CLI with Create React App', N'We’ll go from an empty directory to a solid foundation for an application by running a single command. The create-react-app tool handles all of the complicated setup for us so we can focus on building our application.', 259, NULL, NULL, NULL)
INSERT [dbo].[Lesson] ([ID], [CourseID], [InstructorID], [Name], [Intro], [Time], [Video], [Order], [IsPro]) VALUES (9, 3, 7, N'Render a React UI with JSX', N'We’ll dive right into JSX by rendering a static version of what our application will look like. We’ll cover the basic syntax of JSX and point out where it differs from html.', 168, N'https://egghead.io/lessons/react-render-a-react-ui-with-jsx', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Lesson] OFF
SET IDENTITY_INSERT [dbo].[Technology] ON 

INSERT [dbo].[Technology] ([ID], [Name], [Intro], [Image], [MediumImage], [LargeImage], [NumberCourses], [NumberLessons]) VALUES (1, N'React', N'Lots of people use React as the V in MVC. Since React makes no assumptions about the rest of your technology stack, it''s easy to try it out on a small feature in an existing project.', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [Image], [MediumImage], [LargeImage], [NumberCourses], [NumberLessons]) VALUES (2, N'JavaScript', N'JavaScript® (often shortened to JS) is a lightweight, interpreted, object-oriented language with first-class functions, most known as the scripting language for Web pages, but used in many non-browser environments as well such as node.js or Apache CouchDB. It is a prototype-based, multi-paradigm scripting language that is dynamic, and supports object-oriented, imperative, and functional programming styles.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [Image], [MediumImage], [LargeImage], [NumberCourses], [NumberLessons]) VALUES (3, N'NodeJS', N'Node.js is a platform built on Chrome''s JavaScript runtime for easily building fast, scalable network applications. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient, perfect for data-intensive real-time applications that run across distributed devices.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [Image], [MediumImage], [LargeImage], [NumberCourses], [NumberLessons]) VALUES (4, N'HTML5', N'HTML 5 is the structure of our web pages. It is the markup that represents the DOM (document object model).', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [Image], [MediumImage], [LargeImage], [NumberCourses], [NumberLessons]) VALUES (5, N'Docker', N'Docker containers wrap a piece of software in a complete filesystem that contains everything needed to run: code, runtime, system tools, system libraries – anything that can be installed on a server. This guarantees that the software will always run the same, regardless of its environment.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [Image], [MediumImage], [LargeImage], [NumberCourses], [NumberLessons]) VALUES (6, N'TypeScript', N'TypeScript lets you write JavaScript the way you really want to. TypeScript is a typed superset of JavaScript that compiles to plain JavaScript.

Any browser. Any host. Any OS. Open Source.', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Technology] OFF
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Technology] FOREIGN KEY([TeachnologyID])
REFERENCES [dbo].[Technology] ([ID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Technology]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Lesson] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lesson] ([ID])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Lesson]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Course]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Instructor] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructor] ([ID])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Instructor]
GO
USE [master]
GO
ALTER DATABASE [EggDB] SET  READ_WRITE 
GO
