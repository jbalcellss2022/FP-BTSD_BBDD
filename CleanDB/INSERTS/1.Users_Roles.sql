BEGIN TRANSACTION

INSERT [dbo].[SysRoles] ([Role], [Description]) VALUES (N'10', N'Web User')
INSERT [dbo].[SysRoles] ([Role], [Description]) VALUES (N'20', N'API User')
GO

SET IDENTITY_INSERT [dbo].[AppUsersRoles] ON 

INSERT [dbo].[AppUsersRoles] ([Id], [UserId], [Role]) VALUES (2, N'850f9bc6-de34-416c-bfc1-859c06c5db27', N'10')
INSERT [dbo].[AppUsersRoles] ([Id], [UserId], [Role]) VALUES (3, N'a7a1f868-2cac-4c0d-9c01-5a01832cb4d0', N'20')
INSERT [dbo].[AppUsersRoles] ([Id], [UserId], [Role]) VALUES (4, N'e13399d0-21f2-4bf9-965f-f14c3ce30658', N'10')
INSERT [dbo].[AppUsersRoles] ([Id], [UserId], [Role]) VALUES (6, N'7f1869ab-82ea-4f7a-a55a-930ff1e5a33a', N'20')
INSERT [dbo].[AppUsersRoles] ([Id], [UserId], [Role]) VALUES (7, N'6c427fb9-34dd-45b9-9d16-b7bfc73b9764', N'10')

SET IDENTITY_INSERT [dbo].[AppUsersRoles] OFF
GO

--ROLLBACK
COMMIT