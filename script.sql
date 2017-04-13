USE [master]
GO
/****** Object:  Database [EggHeadCodeFirst.DAL.EggHeadContext]    Script Date: 4/13/2017 8:09:19 AM ******/
CREATE DATABASE [EggHeadCodeFirst.DAL.EggHeadContext]
GO
USE [EggHeadCodeFirst.DAL.EggHeadContext]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 4/13/2017 8:09:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TechnologyID] [int] NOT NULL,
	[InstructorID] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Intro] [nvarchar](max) NOT NULL,
	[SmImage] [nvarchar](max) NULL,
	[MdImage] [nvarchar](max) NULL,
	[LgImage] [nvarchar](max) NULL,
	[IsPro] [bit] NOT NULL,
	[TotalLessons] [int] NOT NULL,
	[EstimatedTime] [int] NOT NULL,
	[LastUpdate] [timestamp] NOT NULL,
 CONSTRAINT [PK_dbo.Course] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 4/13/2017 8:09:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[IsComplete] [bit] NOT NULL,
	[TimeStart] [datetime] NOT NULL,
	[OrderState] [int] NOT NULL,
	[LastActive] [timestamp] NULL,
 CONSTRAINT [PK_dbo.Enrollment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 4/13/2017 8:09:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Intro] [nvarchar](max) NULL,
	[ShortIntro] [nvarchar](max) NULL,
	[GooglePlus] [nvarchar](max) NULL,
	[Twitter] [nvarchar](max) NULL,
	[Facebook] [nvarchar](max) NULL,
	[GitHub] [nvarchar](max) NULL,
	[Blog] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[SmAvatar] [nvarchar](max) NULL,
	[MdAvatar] [nvarchar](max) NULL,
	[LgAvatar] [nvarchar](max) NULL,
	[TotalCourses] [int] NOT NULL,
	[LastUpdate] [timestamp] NOT NULL,
 CONSTRAINT [PK_dbo.Instructor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 4/13/2017 8:09:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Intro] [nvarchar](max) NULL,
	[EstimatedTime] [int] NOT NULL,
	[Video] [nvarchar](max) NOT NULL,
	[Order] [int] NOT NULL,
	[IsPro] [bit] NOT NULL,
	[LastUpdate] [timestamp] NOT NULL,
 CONSTRAINT [PK_dbo.Lesson] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 4/13/2017 8:09:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Intro] [nvarchar](max) NULL,
	[GooglePlus] [nvarchar](max) NULL,
	[Twitter] [nvarchar](max) NULL,
	[Facebook] [nvarchar](max) NULL,
	[Blog] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[SmAvatar] [nvarchar](max) NULL,
	[MdAvatar] [nvarchar](max) NULL,
	[LgAvatar] [nvarchar](max) NULL,
	[ExpiredProTime] [datetime] NOT NULL,
	[LastUpdate] [timestamp] NOT NULL,
 CONSTRAINT [PK_dbo.Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Technology]    Script Date: 4/13/2017 8:09:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Technology](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Intro] [nvarchar](max) NOT NULL,
	[SmImage] [nvarchar](max) NULL,
	[MdImage] [nvarchar](max) NULL,
	[LgImage] [nvarchar](max) NULL,
	[TotalCourses] [int] NOT NULL,
	[TotalLessons] [int] NOT NULL,
	[LastUpdate] [timestamp] NOT NULL,
 CONSTRAINT [PK_dbo.Technology] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Course] ON 

GO
INSERT [dbo].[Course] ([ID], [TechnologyID], [InstructorID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [IsPro], [TotalLessons], [EstimatedTime]) VALUES (27, 1, 2, N'Start Using React to Build Web Applications', N'React is a "javascript library for building user interfaces" from the fine folks at Facebook & Instagram. It strictly focuses on the "V" in your MVC applications, and touts a blazing fast virtual DOM diff implementation.
This series will explore the basic fundamentals of React to get you started.
When you''ve finished with this series, be sure to check out React Flux Architecture for real-world React application development.', N'https://d2eip9sf3oo6c2.cloudfront.net/tech/defaults/course_image_thumb_react.png', N'https://d2eip9sf3oo6c2.cloudfront.net/series/square_covers/000/000/003/thumb/course_image.png?1457454986', N'https://d2eip9sf3oo6c2.cloudfront.net/series/covers/000/000/003/full/course_banner.png?1457396165', 0, 21, 3960)
GO
INSERT [dbo].[Course] ([ID], [TechnologyID], [InstructorID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [IsPro], [TotalLessons], [EstimatedTime]) VALUES (30, 1, 3, N'Build Your First Production Quality React App', N'With the variety of choice we have in building modern web applications using JavaScript, it can make it difficult to understand where to even begin. We live in a wondrous era, where every problem we have seems to have a corresponding javascript module on npm that we can install with just a few keystrokes. It’s easy!  Often, “easy” can mean the opposite of simple. Easy is “quick to do”, where simple is “quick to understand”.
KISS.
In this course you will learn how to build production quality React applications. We will strive to keep things as simple as possible, with minimal dependencies. Instead of typing npm install, we will build our own simple solutions first, to get a solid understanding of the problems that we are solving through libraries. We will build our tools in a functional style, and write appropriate unit tests to verify that they work as expected.
If you are brand new to React, you’ll want to read the documentation and watch our free React Fundamentals course.', N'https://d2eip9sf3oo6c2.cloudfront.net/tech/defaults/course_image_thumb_react.png', N'https://d2eip9sf3oo6c2.cloudfront.net/series/square_covers/000/000/092/thumb/EGH_ProductReact-2.png?1485298529', N'https://d2eip9sf3oo6c2.cloudfront.net/series/covers/000/000/092/full/EGH_ProductReact-2-cover.png?1485298529', 0, 24, 6660)
GO
INSERT [dbo].[Course] ([ID], [TechnologyID], [InstructorID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [IsPro], [TotalLessons], [EstimatedTime]) VALUES (32, 1, 3, N'Building React Applications with Idiomatic Redux', N'This course will pick up where we left off with the Redux Fundamentals course. If you haven''t watched that yet, you are highly encouraged to do so!
You are about to learn practical production ready techniques for building your React and Redux applications. You will explore advanced state management, middleware, React Router integration, and other common problems you are likely to encounter while building applications for your clients and customers.
Even if you have already spent time studying Redux, this course will show you better practices straight from the library''s creator Dan Abramov.', N'https://d2eip9sf3oo6c2.cloudfront.net/tech/defaults/course_image_thumb_react.png', N'https://d2eip9sf3oo6c2.cloudfront.net/series/square_covers/000/000/053/thumb/redux-solutions-react-sq.png?1464725666', N'https://d2eip9sf3oo6c2.cloudfront.net/series/covers/000/000/053/full/redux-solutions-cover.png?1464725666', 0, 27, 8220)
GO
INSERT [dbo].[Course] ([ID], [TechnologyID], [InstructorID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [IsPro], [TotalLessons], [EstimatedTime]) VALUES (34, 1, 4, N'Build a React Native Todo Application', N'In this course we’ll explore getting started with a basic React Native application on both iOS and Android. We’ll learn about using React Native components, how to build custom components, how to layout an application using Flexbox, and how to style components.
We’ll also focus on how to use state to control components, how to persist information across application reloads with AsyncStorage, and how to inline edit in a ListView.
The ultimate goal is to gain an understanding of how to get started building simple React Native applications.', N'https://d2eip9sf3oo6c2.cloudfront.net/tech/defaults/course_image_thumb_react.png', N'https://d2eip9sf3oo6c2.cloudfront.net/series/square_covers/000/000/090/thumb/EGH_ReactNative_ToDo-Final.png?1486518728', N'https://d2eip9sf3oo6c2.cloudfront.net/series/covers/000/000/090/full/EGH_ReactNative_ToDo-Final-cover.png?1484078267', 0, 13, 2460)
GO
INSERT [dbo].[Course] ([ID], [TechnologyID], [InstructorID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [IsPro], [TotalLessons], [EstimatedTime]) VALUES (35, 2, 2, N'Learn ES6 (ECMAScript 2015)', N'This course takes a look at some of the new features that JavaScript has available with ES6 (ECMAScript 2015). It is a "montage" from several instructors.', N'https://d2eip9sf3oo6c2.cloudfront.net/tech/defaults/course_image_thumb_js.png', N'https://d2eip9sf3oo6c2.cloudfront.net/series/square_covers/000/000/049/thumb/EGH_LearnES6_Final.png?1471878649', N'https://d2eip9sf3oo6c2.cloudfront.net/series/covers/000/000/049/full/egghead-learn-es6.png?1471878648', 0, 16, 3180)
GO
INSERT [dbo].[Course] ([ID], [TechnologyID], [InstructorID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [IsPro], [TotalLessons], [EstimatedTime]) VALUES (37, 2, 2, N'Using Webpack for Production JavaScript Applications
', N'Webpack is one of the most popular tools for bundling JavaScript applications and libraries, and it''s growing more popular every day. It is so loaded with features that it''s sometimes difficult to know what''s even possible.
In this course, Kent C. Dodds takes you through some of the most valuable features of the Webpack JavaScript module bundler. We''ll learn a ton about what it takes to optimize your Webpack configuration and your application to make it as fast as it can possibly be. We''ll also go over what it takes to setup and write tests with webpack, Karma, Mocha, and Chai.
This course covers Webpack 2, but should also be relevant for Webpack 1.x.', N'https://d2eip9sf3oo6c2.cloudfront.net/tech/defaults/course_image_thumb_js.png', N'https://d2eip9sf3oo6c2.cloudfront.net/series/square_covers/000/000/054/thumb/EGH_Webpack-Final.png?1466197336', N'https://d2eip9sf3oo6c2.cloudfront.net/series/covers/000/000/049/full/egghead-learn-es6.png?', 0, 16, 3854)
GO
INSERT [dbo].[Course] ([ID], [TechnologyID], [InstructorID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [IsPro], [TotalLessons], [EstimatedTime]) VALUES (38, 2, 4, N'GIF Loop Coder for Creating Animation', N'GIF Loop Coder is a desktop tool for creating looping animations using JavaScript code. It is hours of fun to be had, and the results are always interesting.
With this course, you will learn how to create animations with GLC. GLC is an open source application, built on top of Electron. You can find it on Github!', N'https://d2eip9sf3oo6c2.cloudfront.net/tech/defaults/course_image_thumb_js.png', N'https://d2eip9sf3oo6c2.cloudfront.net/series/square_covers/000/000/042/thumb/EGH_GIFLooper.png?1465923190', N'https://d2eip9sf3oo6c2.cloudfront.net/series/covers/000/000/042/full/EGH_GIFLooper-cover.png?1465923190', 0, 11, 6660)
GO
INSERT [dbo].[Course] ([ID], [TechnologyID], [InstructorID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [IsPro], [TotalLessons], [EstimatedTime]) VALUES (40, 3, 5, N'Getting Started with Express.js', N'Express is a minimal web server built on Node.js that provides essential functionality for delivering web applications to the browser and mobile devices. This series will guide you through the first steps of using Express for building your own applications.', N'https://d2eip9sf3oo6c2.cloudfront.net/tech/defaults/course_image_thumb_node.png', N'https://d2eip9sf3oo6c2.cloudfront.net/series/square_covers/000/000/018/thumb/course_image.png?1459878161', N'https://d2eip9sf3oo6c2.cloudfront.net/series/covers/000/000/018/full/course_banner.png?1459878161', 0, 11, 3840)
GO
INSERT [dbo].[Course] ([ID], [TechnologyID], [InstructorID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [IsPro], [TotalLessons], [EstimatedTime]) VALUES (42, 3, 5, N'Build Node.js APIs with OpenAPI Spec (Swagger)', N'In this course we will build a ToDo API that stores notes using the OpenAPI Specification (Swagger). We will start with a blank API definition using the Swagger Online Editor. The Swagger definition file will be used to create a Node.js API. Along the way, we will discover how to implement additional details required for a fully functional API such as authorization, authentication, requests and responses. We will also learn about the powerful capabilities of Swagger to generate server side code and client libraries.', N'https://d2eip9sf3oo6c2.cloudfront.net/tech/defaults/course_image_thumb_node.png', N'https://d2eip9sf3oo6c2.cloudfront.net/series/square_covers/000/000/071/thumb/EGH_NodeJSAPI_Swagger_Final.png?1478642608', N'https://d2eip9sf3oo6c2.cloudfront.net/series/covers/000/000/071/full/EGH_NodeJSAPI_Swagger_Final-cover.png?1478642608', 0, 16, 3360)
GO
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Instructor] ON 

GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (2, N'craig-mckeachie', N'Craig ', N'McKeachie', N'Craig McKeachie has been a software developer for 15 years and earned the Microsoft Certified Solutions Developer (MCSD) certification for three generations of Microsoft technology. Craig is the author of the JavaScript Framework Guide: AngularJS, Backbone, and Ember and blogs at funnyant.com.', N'Working at Facebook on React. Creator of Redux.', N'https://plus.GooglePlus.com/+CraigMcKeachie?rel=author', N'https://twitter.com/cmckeachie', N'https://www.facebook.com/kartik32623', NULL, N'http://www.funnyant.com/', N'CraigMcKeachie@gmail.com', N'12345678@', N'0968437649', N'1246 Everett Avenue
', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/036/bio/craig-mckeachie-headshot.png?1447939149', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/036/bio/craig-mckeachie-headshot.png?1447939149', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/036/bio/craig-mckeachie-headshot.png?1447939149', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (3, N'preethi-kasireddy', N'Preethi ', N'Kasireddy', N'A passionate software engineer that loves teaching others everything I learn. In my previous life, I was a venture capitalist at Andreessen Horowitz, where I fell in love with passionate engineers & entrepreneurs and realized I wanted to be "one of them" :)', N'Creator of CycleJS and Rx Marbles. Reactive Programming Expert and RxJS Contributor.', N'https://plus.GooglePlus.com/+CraigMcKeachie?rel=author', N'https://twitter.com/iam_preethi', N'https://www.facebook.com/rachit.aherwar', NULL, N'https://medium.com/@preethikasireddy', N'Kasireddy@gmail.com', N'12345678@', N'0968437646', N'7105 Plover Circle
Fort Worth
Texas', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/042/bio/11895272_10154078186552506_3411075844880369856_o.jpg?1451517982', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/042/bio/11895272_10154078186552506_3411075844880369856_o.jpg?1451517982', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/042/bio/11895272_10154078186552506_3411075844880369856_o.jpg?1451517982', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (4, N'joe-maddalone', N'Joe ', N'Maddalone', N'Joe is a father of five, lives in Chicago, works as a freelance web developer, shares coding tutorials on egghead.io, and codes for fun when not for work.', N'Open-source contibutor. Host of the JavascriptAir podcast. Engineering at PayPal.', N'https://plus.GooglePlus.com/+JoeMaddalone?rel=author', N'https://twitter.com/joemaddalone', N'https://www.facebook.com/profile.php?thuynguyen', NULL, N'http://www.joemaddalone.com/', N'Maddalone@gmail.com', N'12345678@', N'0968377646', N'524 Pecan Street
Crowley
Texas', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/007/bio/Cropped-Portrait-Attempt.jpg?1391746899', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/007/bio/Cropped-Portrait-Attempt.jpg?1391746899', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/007/bio/Cropped-Portrait-Attempt.jpg?1391746899', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (5, N'andrew-van-slaars', N'Kent ', N'C. Dodds', N'Full stack developer, currently focused on building applications with JavaScript. I love learning new libraries, languages and tools and I''m passionate about sharing the things I learn with others.', N'Senior Front-End Engineer at Deque Systems working on accessibility tools with axe-core.', N'https://plus.GooglePlus.com/+JoeMaddalone?rel=author', N'https://twitter.com/avanslaars', N'https://www.facebook.com/imstifler', NULL, N'https://kentcdodds.com/', N'kentcdodds@gmail.com', N'12345678@', N'0968377699', N'1022 Bridges Dr
Arlington
Texas', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/011/bio/photo-512.png?1469949786', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/011/bio/photo-512.png?1469949786', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/011/bio/photo-512.png?1469949786', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (6, N'justin-gordon', N'Justin ', N'Gondon', N'Aloha! Inspired by the Ruby on Rails Community, Justin began blogging on RailsOnMaui and working on open source. A philosophy of sharing, plus React/Webpack/Rails integration, developed into ShakaCode! A family, coding, and surfing in Maui create a healthy life balance.', NULL, N'http://strangemilk.com', N'http://strangemilk.com', N'https://www.facebook.com/imstifler', NULL, N'https://www.facebook.com/imstifler', N'Gondon@gmail.com', N'12345678@', N'0906167386', N'6287 Renwood Dr
Fort Worth
Texas', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/012/thumb/image1.jpeg?1420665163', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/012/thumb/image1.jpeg?1420665163', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/012/thumb/image1.jpeg?1420665163', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (7, N'jacob-carter', N'Jacob Carter', N'Carter', N'Hello! I am a front end developer at Integrate who loves JavaScript. Specifically I love the Angular framework. While I’m not doing front end coding at work I’m doing front end coding at home. Building as many applications as I can, some serious, some for fun, and some just to learn new things.', NULL, N'http://strangemilk.com', NULL, N'https://www.facebook.com/rachit.aherwar', NULL, NULL, N'Jacop@gmail.com', N'1234568@', N'0936759386', N'8940 Marilyn Dr
Frisco
Texas', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/071/thumb/avatar.jpg?1463470224', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/071/thumb/avatar.jpg?1463470224', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/071/thumb/avatar.jpg?1463470224', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (8, N'preethi-kasireddy', N'Preethi', N'Kasireddy', N'A passionate software engineer that loves teaching others everything I learn. In my previous life, I was a venture capitalist at Andreessen Horowitz, where I fell in love with passionate engineers & entrepreneurs and realized I wanted to be "one of them" ', NULL, N'https://medium.com/@preethikasireddy', N'https://twitter.com/iam_preethi', N'https://www.facebook.com/rachit.aherwar', NULL, NULL, N'Preethi@gmail.com', N'1223445678@', N'0934352386', N'1617 Martha Drive', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/017/thumb/tylermcginnis-2016.jpg?1468915449', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/017/thumb/tylermcginnis-2016.jpg?1468915449', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/017/thumb/tylermcginnis-2016.jpg?1468915449', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (9, N'thomas-burleson', N'Thomas ', N'Burleson', N'Thomas is the Team Lead for GooglePlus''s Angular Material. See http://material.angularjs.org and http://github.com/angular/material.', NULL, N'https://plus.GooglePlus.com/+ThomasBurleson?rel=author', N'https://twitter.com/ThomasBurleson', N'https://www.facebook.com/rachit.aherwar', NULL, NULL, N'Thomas@gmail.com', N'1234', N'0936975386', N'PO Box 121155', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/037/thumb/956631.jpeg?1474994568', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/037/thumb/956631.jpeg?1474994568', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/037/thumb/956631.jpeg?1474994568', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (10, N'123452', N'Marius ', N'Schulz', N'I''m a software developer, web enthusiast, and computer science student living in Munich, Germany. When I''m not programming, I love to read or go latin dancing.', NULL, N'https://blog.mariusschulz.com/', N'https://twitter.com/mariusschulz', N'https://www.facebook.com/rachit.aherwar', NULL, NULL, N'Schulz@yahoo.com', N'shulz123', N'0936705286	', N'8572 Bluebird Lane', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/110/bio/headshot_square.jpg?1484300646', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/110/bio/headshot_square.jpg?1484300646', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/110/bio/headshot_square.jpg?1484300646', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (11, N'121242', N'Trevor ', N'Ewen', N'Trevor is an experienced software consultant, and is currently regarded for his work in HTML5 and the Angular JS community. Presently he resides and produces for Neosavvy, a New York based, computer-science consultancy.', NULL, N'http://www.neosavvy.com/', N'https://twitter.com/pearoftheweek', N'https://www.facebook.com/rachit.aherwar', NULL, NULL, N'Trevor@yahoo.com', N'trevor123', N'0904172386', N'Texas Tech University
Math Building, Room 4', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/030/thumb/Untitled-1.jpg?1441957411', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/030/thumb/Untitled-1.jpg?1441957411', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/030/thumb/Untitled-1.jpg?1441957411', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (12, N'123121', N'Andrew', N' Van Slaars', N'Full stack developer, currently focused on building applications with JavaScript. I love learning new libraries, languages and tools and I''m passionate about sharing the things I learn with others.', NULL, NULL, N'https://twitter.com/avanslaars', NULL, NULL, N'http://vanslaars.io/', N'Andrew@gmail.com', N'andrew123', N'0904245386', N'6750 Fossil Park CT', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/082/bio/avitar_from_wedding_500_500.png?1471630509', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/082/bio/avitar_from_wedding_500_500.png?1471630509', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/082/bio/avitar_from_wedding_500_500.png?1471630509', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (13, N'123129', N'Hannah ', N'Davis', N'I’m a programmer, data scientist, and musician. I like music generation, data visualization and sonification, natural language processing, machine learning, and storytelling in various formats. I’m currently working on TransProse, a program that translates literature (and emotional data) into music, and creating datasets for machine learning.
', NULL, N'https://twitter.com/ahandvanish', NULL, NULL, NULL, N'http://www.hannahishere.com/', N'Hannah.davis@yahoo.com', N'hannah123', N'01259179999	', N'2550 McMillan Parkway', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/069/bio/eggheadpic.png?1462154907', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/069/bio/eggheadpic.png?1462154907', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/069/bio/eggheadpic.png?1462154907', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (14, N'123130', N'Bonnie ', N'Eisenman', N'Working on Scala and distributed systems stuff at Twitter. Author of Learning React Native. Buy my book: http://bit.ly/lrnamaff', NULL, N'https://twitter.com/brindelle', NULL, NULL, NULL, N'http://blog.bonnieeisenman.com/', N'Bonnie@yahoo.com', N'Bonnire123', N'0984466633', N'707 Clebud Dr', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/046/bio/mu_cumbria_square.jpeg?1484926144', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/046/bio/mu_cumbria_square.jpeg?1484926144', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/046/bio/mu_cumbria_square.jpeg?1484926144', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (15, N'123131', N'John', N'Lindquist', N'John Lindquist is a co-founder of egghead.io
John has spent the majority of his career developing Rich Web Applications. Before starting egghead.io, John worked at JetBrains as a WebStorm evangelist, and before that he was a Technical Architect at Isobar leading large teams in building the latest and greatest in web apps for the Air Force, HBO, and Bloomberg.', NULL, NULL, N'https://twitter.com/johnlindquist', NULL, NULL, N'http://egghead.io/', N'john.lindquist@gmail.com', N'lindquist123', N'0987466633', N'9636 Cove Meadow Dr', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/005/bio/920452_10151765169388510_756889833_o.jpg?1387142639', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/005/bio/920452_10151765169388510_756889833_o.jpg?1387142639', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/005/bio/920452_10151765169388510_756889833_o.jpg?1387142639', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (16, N'123132', N'Keith', N'Peters', N'Keith Peters is a developer based in the Boston area. He is the author / coauthor of over a dozen programming books including Playing with Chaos: Programming Fractals and Strange Attractors in JavaScript and HTML 5 Animation with Javascript and the Actionscript 3.0 Cookbook.', NULL, N'https://twitter.com/bit101', N'https://plus.GooglePlus.com/+KeithPeters?rel=author', NULL, NULL, N'http://www.bit-101.com/blog/', N'keith.peter@yahoo.com', N'keith12', N'01673912912', N'P. O. Box 237', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/013/bio/eggheadphoto.png?1421766974', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/013/bio/eggheadphoto.png?1421766974', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/013/bio/eggheadphoto.png?1421766974', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (17, N'123133', N'Brad 
', N'Martin', N'Brad Martin spends most of his time writing TypeScript and leveraging NativeScript to build cross platform native Android and iOS apps.
', NULL, N'https://twitter.com/bradwaynemartin', NULL, NULL, NULL, N'https://bradmartin.net/', N'brad.martin@gmail.com', N'brad123', N'01673928912', N'3316 Browning Court East', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/097/bio/IMG_20161109_172809.jpg?1478734106', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/097/bio/IMG_20161109_172809.jpg?1478734106', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/097/bio/IMG_20161109_172809.jpg?1478734106', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (18, N'123134', N'Mike ', N'Hartington', N'Constantly sarcastic, developer for Ionic Framework, lover of craft beers, tries to play guitar.
', NULL, N'https://twitter.com/mhartington', NULL, NULL, NULL, N'http://mhartington.io/', N'mike.harmiton@gmail.com', N'mkie123', N'01789376128', N'1413 Seneca Court', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/062/bio/mike-headshot.png?1457958228', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/062/bio/mike-headshot.png?1457958228', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/062/bio/mike-headshot.png?1457958228', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (19, N'123135', N'Cameron ', N'Nokes', N'I''m a front-end developer at Domo. I like all things JavaScript. I also believe in unicorns.', NULL, N'https://twitter.com/ccnokes', NULL, NULL, NULL, N'https://cameronnokes.com/', N'Cameron', N'cameron123', N'0987368172', N'6817 Cahoba Dr', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/113/bio/profile.jpeg?1485472760', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/113/bio/profile.jpeg?1485472760', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/113/bio/profile.jpeg?1485472760', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (20, N'andre-staltz', N'André ', N'Staltz', N'Andre is a user interface engineer at Futurice, with extensive knowledge
in reactive programming. He is a contributor to RxJS, has built
RxMarbles, written an introduction to reactive programming which went
viral, and collaborated to design ReactiveX.io. His current mission is
to redefine how we understand and structure user interfaces with the
reactive web framework Cycle.js.', NULL, N'https://twitter.com/andrestaltz', NULL, NULL, NULL, N'http://staltz.com/', N'Stalzt.andre@gmail.com', N'andres_abc', N'0976782631', N'16015 White Fawn Drive', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/024/bio/andre_500.jpg?1435599944', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/024/bio/andre_500.jpg?1435599944', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/024/bio/andre_500.jpg?1435599944', 10)
GO
INSERT [dbo].[Instructor] ([ID], [UID], [FirstName], [LastName], [Intro], [ShortIntro], [GooglePlus], [Twitter], [Facebook], [GitHub], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [TotalCourses]) VALUES (21, N'123137', N'Joel ', N'Hooks', N'Joel is a software developer living in Fort Worth, Texas. He''s passionate about home educating his 4 kids and all things technology. He''s also keeps egghead.io up and running for your learning pleasure!', NULL, N'https://twitter.com/jhooks', NULL, NULL, NULL, N'http://joelhooks.com/', N'hooks.joel@gmail.com', N'hooks_joel', N'0971928372', N'1513 Catalina Dr', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/003/bio/joel_head.jpg?1421260465', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/003/bio/joel_head.jpg?1421260465', N'https://d2eip9sf3oo6c2.cloudfront.net/instructors/avatars/000/000/003/bio/joel_head.jpg?1421260465', 10)
GO
SET IDENTITY_INSERT [dbo].[Instructor] OFF
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

GO
INSERT [dbo].[Lesson] ([ID], [CourseID], [Name], [Intro], [EstimatedTime], [Video], [Order], [IsPro]) VALUES (32, 27, N' Create a Basic Component using Vue.js', N'Vue.js is a "progressive framework for building user interfaces." The core of Vue is focused on the view layer only. It''s easy to get started and quick to set up.
In this lesson, we will create a basic Vue component using the new Vue() method and add data properties to show dynamic content in window.', 64, N'~/Videos/747a8fc6b9e502bf74a109693067f511eed1dc8b.mp4', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Lesson] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

GO
INSERT [dbo].[Student] ([ID], [UID], [FirstName], [LastName], [Intro], [GooglePlus], [Twitter], [Facebook], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [ExpiredProTime]) VALUES (1, N'14115', N'Luis', N'Nam', N'I am a student', N'https://plus.GooglePlus.com/+CraigMcKeachie?rel=author', N'https://twitter.com/cmckeachie', N'https://www.facebook.com/kartik32623', NULL, N'NamLuis@gmail.com', N'1234567', N'0799192383', N'5000 Meadow Lakes Dr 120', N'~/image/student/1', N'~/image/student/1', N'~/image/student/1', CAST(N'2017-12-30T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([ID], [UID], [FirstName], [LastName], [Intro], [GooglePlus], [Twitter], [Facebook], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [ExpiredProTime]) VALUES (2, N'14116', N'Brett ', N'Cassette', N'Brett is a comedian and writer who has heard of, but never truly experienced, programming', NULL, N'http://twitter.com/brettcassette', NULL, NULL, N'brett@yahoo.com', N'123456', N'0799191231', N'1200 Stonehedge Pl', N'~/image/student/2', N'~/image/student/2', N'~/image/student/2', CAST(N'2017-12-30T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([ID], [UID], [FirstName], [LastName], [Intro], [GooglePlus], [Twitter], [Facebook], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [ExpiredProTime]) VALUES (3, N'14117', N'Iheanyi ', N'Ekechukwu', N'Iheanyi is a Software Engineer at DigitalOcean in New York City. He graduated from the University of Notre Dame with degrees in both Computer Science and Graphic Design. He enjoys designing and building ambitious web applications, especially with Ember.js.', NULL, N'https://twitter.com/kwuchu', NULL, NULL, N'Iheanyi@gmail.com', N'1727123', N'01651231231', N'1000 Sandy Beach Rd', N'~/image/student/3', N'~/image/student/3', N'~/image/student/3', CAST(N'2017-12-30T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([ID], [UID], [FirstName], [LastName], [Intro], [GooglePlus], [Twitter], [Facebook], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [ExpiredProTime]) VALUES (4, N'14132', N'Josh ', N'Black', N'Front-End Developer for IBM Watson. Overly excited about all things web-related', NULL, NULL, NULL, N'https://github.com/joshblack', N'Joshblack@outlook.com', N'122128djj', N'01643231231', N'8940 Marilyn Dr', N'~/image/student/4', N'~/image/student/4', N'~/image/student/4', CAST(N'2017-12-30T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([ID], [UID], [FirstName], [LastName], [Intro], [GooglePlus], [Twitter], [Facebook], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [ExpiredProTime]) VALUES (5, N'12312', N'Vincent ', N'Orr', N'Functional Programming enthusiast, teaching as I learn. FP can be very overwhelming at an entry level, a lot of learning material is overly complex and intimidating. Sometimes forgetting what may seem simple, is a mountain of information for beginners. Learning FP doesn''t have to be that complicated and I hope I can aid you in your journey! :-)', NULL, N'https://twitter.com/_cmdv_', NULL, N'https://github.com/Cmdv', N'orr.vincent@gmail.com', N'1987371j', N'01643232342', N'5317 Timberwilde Cir', N'~/image/student/5', N'~/image/student/5', N'~/image/student/5', CAST(N'2017-12-30T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([ID], [UID], [FirstName], [LastName], [Intro], [GooglePlus], [Twitter], [Facebook], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [ExpiredProTime]) VALUES (6, N'12315', N'J.S. Leonard', N'Dicapio', N'J.S. Leonard resides in his birthplace, Las Vegas, Nevada, where he weaves words, code and colors into remarkable experiences. He is married to a pretty rad chick and has two crazy young boys. No, he doesn''t gamble. Yes, people actually live in Las Vegas.', NULL, NULL, NULL, NULL, N'Dicapio@gmail.com', N'leonardo123', N'01642342343', N'1617 Martha Drive', N'~/image/student/6', N'~/image/student/6', N'~/image/student/6', CAST(N'2017-12-30T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([ID], [UID], [FirstName], [LastName], [Intro], [GooglePlus], [Twitter], [Facebook], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [ExpiredProTime]) VALUES (9, N'12318', N'Clinkinbeard', N'Be', N'Ben Clinkinbeard is fully immersed in the JavaScript ecosystem with a particular focus on Node, React, Redux, D3, and ES6+.', NULL, NULL, NULL, NULL, N'BenAnpha@gmail.com', N'benanpha', N'01623242423', N'PO Box 121155', N'~/image/student/7', N'~/image/student/7', N'~/image/student/7', CAST(N'2017-12-30T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([ID], [UID], [FirstName], [LastName], [Intro], [GooglePlus], [Twitter], [Facebook], [Blog], [Email], [Password], [Phone], [Address], [SmAvatar], [MdAvatar], [LgAvatar], [ExpiredProTime]) VALUES (10, N'12310', N'Tyler McGinnis', N'Mc', N'Partner at React Training. GooglePlus Expert.', NULL, NULL, NULL, NULL, N'Mctyler.13@gmail.com', N'tylermc123', N'01643312312', N'707 Clebud Dr', N'~/image/student/9', N'~/image/student/9', N'~/image/student/9', CAST(N'2017-12-30T12:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Technology] ON 

GO
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [TotalCourses], [TotalLessons]) VALUES (1, N'React', N'Lots of people use React as the V in MVC. Since React makes no assumptions about the rest of your technology stack, it''s easy to try it out on a small feature in an existing project.', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/react-7b90239e805d8b06ca263be745f8ad5f.svg', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/react-7b90239e805d8b06ca263be745f8ad5f.svg', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/react-7b90239e805d8b06ca263be745f8ad5f.svg', 13, 256)
GO
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [TotalCourses], [TotalLessons]) VALUES (2, N'JavaScript', N'JavaScript® (often shortened to JS) is a lightweight, interpreted, object-oriented language with first-class functions, most known as the scripting language for Web pages, but used in many non-browser environments as well such as node.js or Apache CouchDB. It is a prototype-based, multi-paradigm scripting language that is dynamic, and supports object-oriented, imperative, and functional programming styles.', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/js-5e02473095281c2062c08e6a8d499936.svg', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/js-5e02473095281c2062c08e6a8d499936.svg', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/js-5e02473095281c2062c08e6a8d499936.svg', 19, 435)
GO
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [TotalCourses], [TotalLessons]) VALUES (3, N'NodeJS', N'Node.js is a platform built on Chrome''s JavaScript runtime for easily building fast, scalable network applications. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient, perfect for data-intensive real-time applications that run across distributed devices.', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/node-48eacec51baa2fa9215f271df5b2afd5.svg', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/node-48eacec51baa2fa9215f271df5b2afd5.svg', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/node-48eacec51baa2fa9215f271df5b2afd5.svg', 4, 109)
GO
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [TotalCourses], [TotalLessons]) VALUES (4, N'HTML5', N'HTML 5 is the structure of our web pages. It is the markup that represents the DOM (document object model).', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/html5-ac1c12ecc8b493ebe4e15ebcfbfa142a.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/html5-ac1c12ecc8b493ebe4e15ebcfbfa142a.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/html5-ac1c12ecc8b493ebe4e15ebcfbfa142a.png', 4, 14)
GO
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [TotalCourses], [TotalLessons]) VALUES (5, N'Docker', N'Docker containers wrap a piece of software in a complete filesystem that contains everything needed to run: code, runtime, system tools, system libraries – anything that can be installed on a server. This guarantees that the software will always run the same, regardless of its environment.', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/docker-5dbe6aa904703ead574c339e5b603f6c.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/docker-5dbe6aa904703ead574c339e5b603f6c.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/docker-5dbe6aa904703ead574c339e5b603f6c.png', 2, 6)
GO
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [TotalCourses], [TotalLessons]) VALUES (6, N'TypeScript', N'TypeScript lets you write JavaScript the way you really want to. TypeScript is a typed superset of JavaScript that compiles to plain JavaScript.
Any browser. Any host. Any OS. Open Source.', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/typescript-35cea56e4856d762ca6b96fa1656922f.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/typescript-35cea56e4856d762ca6b96fa1656922f.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/typescript-35cea56e4856d762ca6b96fa1656922f.png', 2, 42)
GO
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [TotalCourses], [TotalLessons]) VALUES (7, N'Angular 2', N'Angular is a development platform for creating applications using modern web standards. Angular includes a wealth of essential features such as mobile gestures, animations, filtering, routing, data binding, security, internationalization, and beautiful UI components. It''s extremely modular, lightweight, and easy to learn.', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/angular2-119739556a386494031ce4ad024f8de9.svg', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/angular2-119739556a386494031ce4ad024f8de9.svg', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/react-7b90239e805d8b06ca263be745f8ad5f.svg', 11, 156)
GO
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [TotalCourses], [TotalLessons]) VALUES (8, N'Angular 1.X', N'AngularJS is an open-source JavaScript framework, maintained by Google, that assists with running single-page applications. Its goal is to augment web-based applications with model–view–controller (MVC) capability, in an effort to make both development and testing easier.', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/angularjs-93df07d33b918e613d5639665c98684d.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/angularjs-93df07d33b918e613d5639665c98684d.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/angularjs-93df07d33b918e613d5639665c98684d.png', 12, 309)
GO
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [TotalCourses], [TotalLessons]) VALUES (9, N'CSS', N'Cascading Style Sheets bring order and beauty to our applications.', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/css-b5bcc18fc30beaf9701f17dadac80e60.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/css-b5bcc18fc30beaf9701f17dadac80e60.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/css-b5bcc18fc30beaf9701f17dadac80e60.png', 3, 55)
GO
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [TotalCourses], [TotalLessons]) VALUES (10, N'Elm', N'Elm is a programming language that provides a clean functional syntax for writing HTML web applications. It promises zero runtime exceptions, fast rendering, time-travel debugging, and much more.', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/elm-85f2a1272f115fce345db32f14f46379.svg', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/elm-85f2a1272f115fce345db32f14f46379.svg', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/elm-85f2a1272f115fce345db32f14f46379.svg', 1, 18)
GO
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [TotalCourses], [TotalLessons]) VALUES (11, N'D3', N'D3.js is a JavaScript library for manipulating documents based on data. D3 helps you bring data to life using HTML, SVG and CSS. D3’s emphasis on web standards gives you the full capabilities of modern browsers without tying yourself to a proprietary framework, combining powerful visualization components and a data-driven approach to DOM manipulation.', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/d3-d1310b8d819e261d3a7ed3a5c371496b.svg', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/d3-d1310b8d819e261d3a7ed3a5c371496b.svg', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/d3-d1310b8d819e261d3a7ed3a5c371496b.svg', 2, 44)
GO
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [TotalCourses], [TotalLessons]) VALUES (12, N'Tools', N'There are many moving parts when building professional web applications. These tools are here to help.', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/otherjs-2e094bbc9a5230ac3fcb9f6c4e6a5594.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/otherjs-2e094bbc9a5230ac3fcb9f6c4e6a5594.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/otherjs-2e094bbc9a5230ac3fcb9f6c4e6a5594.png', 12, 158)
GO
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [TotalCourses], [TotalLessons]) VALUES (13, N'PURESCRIPT', N'A small strongly typed programming language with expressive types that compiles to Javascript, written in and inspired by Haskell.', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/purescript-6791fc74f755c39185707fa18724afd5.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/purescript-6791fc74f755c39185707fa18724afd5.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/purescript-6791fc74f755c39185707fa18724afd5.png', 5, 5)
GO
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [TotalCourses], [TotalLessons]) VALUES (14, N'PostgreSQL', N'PostgreSQL is a powerful, open source object-relational database system. It has more than 15 years of active development and a proven architecture that has earned it a strong reputation for reliability, data integrity, and correctness. It runs on all major operating systems, including Linux, UNIX (AIX, BSD, HP-UX, SGI IRIX, Mac OS X, Solaris, Tru64), and Windows. It is fully ACID compliant, has full support for foreign keys, joins, views, triggers, and stored procedures (in multiple languages). It includes most SQL:2008 data types, including INTEGER, NUMERIC, BOOLEAN, CHAR, VARCHAR, DATE, INTERVAL, and TIMESTAMP. It also supports storage of binary large objects, including pictures, sounds, or video. It has native programming interfaces for C/C++, Java, .Net, Perl, Python, Ruby, Tcl, ODBC, among others, and exceptional documentation.', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/postgres-eb3e6463f4b69fb929443747cd958c2c.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/postgres-eb3e6463f4b69fb929443747cd958c2c.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/postgres-eb3e6463f4b69fb929443747cd958c2c.png', 2, 24)
GO
INSERT [dbo].[Technology] ([ID], [Name], [Intro], [SmImage], [MdImage], [LgImage], [TotalCourses], [TotalLessons]) VALUES (15, N'VueJS', N'Vue (pronounced /vjuː/, like view) is a progressive framework for building user interfaces. Unlike other monolithic frameworks, Vue is designed from the ground up to be incrementally adoptable. The core library is focused on the view layer only, and is very easy to pick up and integrate with other libraries or existing projects. On the other hand, Vue is also perfectly capable of powering sophisticated Single-Page Applications when used in combination with modern tooling and supporting libraries.', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/vue-32a1b0bb3ff12e56be171bdd1375919c.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/vue-32a1b0bb3ff12e56be171bdd1375919c.png', N'https://d1xwtr0qwr70yv.cloudfront.net/assets/tech/vue-32a1b0bb3ff12e56be171bdd1375919c.png', 1, 24)
GO
SET IDENTITY_INSERT [dbo].[Technology] OFF
GO
/****** Object:  Index [IX_InstructorID]    Script Date: 4/13/2017 8:09:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_InstructorID] ON [dbo].[Course]
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TechnologyID]    Script Date: 4/13/2017 8:09:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_TechnologyID] ON [dbo].[Course]
(
	[TechnologyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseID]    Script Date: 4/13/2017 8:09:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_CourseID] ON [dbo].[Enrollment]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentID]    Script Date: 4/13/2017 8:09:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_StudentID] ON [dbo].[Enrollment]
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseID]    Script Date: 4/13/2017 8:09:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_CourseID] ON [dbo].[Lesson]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Course_dbo.Instructor_InstructorID] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructor] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_dbo.Course_dbo.Instructor_InstructorID]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Course_dbo.Technology_TechnologyID] FOREIGN KEY([TechnologyID])
REFERENCES [dbo].[Technology] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_dbo.Course_dbo.Technology_TechnologyID]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Enrollment_dbo.Course_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_dbo.Enrollment_dbo.Course_CourseID]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Enrollment_dbo.Student_StudentID] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_dbo.Enrollment_dbo.Student_StudentID]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Lesson_dbo.Course_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_dbo.Lesson_dbo.Course_CourseID]
GO
USE [master]
GO
ALTER DATABASE [EggHeadCodeFirst.DAL.EggHeadContext] SET  READ_WRITE 
GO
