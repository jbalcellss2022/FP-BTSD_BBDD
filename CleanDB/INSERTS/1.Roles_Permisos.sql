BEGIN TRANSACTION

USE [SealSignSaaS_Dev]
GO

SET IDENTITY_INSERT [dbo].[Roles]  ON   

INSERT INTO [dbo].[Roles] ([ID], [Name], [Description], [SystemAdmin], [Enabled]) VALUES (1, 'Super Admin', '', 0, 1)
INSERT INTO [dbo].[Roles] ([ID], [Name], [Description], [SystemAdmin], [Enabled]) VALUES (2, 'Owner', '', 0, 1)
INSERT INTO [dbo].[Roles] ([ID], [Name], [Description], [SystemAdmin], [Enabled]) VALUES (4, 'Creator', '', 0, 1)
INSERT INTO [dbo].[Roles] ([ID], [Name], [Description], [SystemAdmin], [Enabled]) VALUES (8, 'Aplication API', 'Acceso a los métodos Externos de la API', 0, 1)
INSERT INTO [dbo].[Roles] ([ID], [Name], [Description], [SystemAdmin], [Enabled]) VALUES (9, 'Aplication API sin permisos', 'Acceso a los métodos Externos de la API sin permisos', 0, 1)
INSERT INTO [dbo].[Roles] ([ID], [Name], [Description], [SystemAdmin], [Enabled]) VALUES (10, 'Super Admin GOD', '', 1, 1)
INSERT INTO [dbo].[Roles] ([ID], [Name], [Description], [SystemAdmin], [Enabled]) VALUES (11, 'ExternalSignatory', '    Permite a un usuario realizar firmas OTP usando la API', 0, 1)
INSERT INTO [dbo].[Roles] ([ID], [Name], [Description], [SystemAdmin], [Enabled]) VALUES (12, 'Acceso API Heco', 'Es igual al rol Aplication API, pero con acceso al Controller de Heco', 0, 1)
INSERT INTO [dbo].[Roles] ([ID], [Name], [Description], [SystemAdmin], [Enabled]) VALUES (13, 'ExternalOTP', 'Permite a un usuario generar y verificar codigos OTP usando la API', 0, 1)
INSERT INTO [dbo].[Roles] ([ID], [Name], [Description], [SystemAdmin], [Enabled]) VALUES (14, 'QualifiedDeliveryManager', 'Gestor de Entrega Cualificada', 0, 1)
INSERT INTO [dbo].[Roles] ([ID], [Name], [Description], [SystemAdmin], [Enabled]) VALUES (15, 'Creator EC', 'Usuario Creator solo Entrega Cualificada', 0, 1)
INSERT INTO [dbo].[Roles] ([ID], [Name], [Description], [SystemAdmin], [Enabled]) VALUES (16, 'Owner EC', 'Usuario Owner solo Entrega Cualificada', 0, 1)
INSERT INTO [dbo].[Roles] ([ID], [Name], [Description], [SystemAdmin], [Enabled]) VALUES (17, 'Creator EC+SaaS', 'Usuario Creator  Entrega Cualificada y SaaS', 0, 1)
INSERT INTO [dbo].[Roles] ([ID], [Name], [Description], [SystemAdmin], [Enabled]) VALUES (18, 'Owner EC+SaaS', 'Usuario Owner Entrega Cualificada y SaaS', 0, 1)
INSERT INTO [dbo].[Roles] ([ID], [Name], [Description], [SystemAdmin], [Enabled]) VALUES (19, 'Reader', 'Usuario solo lectura SaaS', 0, 1)

SET IDENTITY_INSERT [dbo].[Roles]  OFF  

INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (1, 'Request' , 'Puede crear nuevas solicitudes de firma', 0) --(Solicitar en Signbox) Por compatibilidad con signbox unimos los conceptos "enviar" y "crear" en un solo permiso, conservando el nombre usado en signbox
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (2, 'Review' , 'Puede revisar y rechazar solicitudes.', 0) --Revisar en Signbox
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (3, 'Sign' , 'Puede firmar rechazar solicitudes', 0) --(Firmar en Signbox) Firmar, revisar y rechazar se controlan con este permiso. Se mantiene el nombre "Sign" por compatibilidad con signbox 
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (4, 'Delegate' , 'Puede nombrar delegados y revisores', 0) --(Delegar en Signbox)Heredado de signbox, no se usa en SaaS
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (5, 'Manage' , 'Administradores de la plataforma', 0) --(Administrar en Signbox)Heredado de signbox, se usa en SaaS para el "Super Admin Factum", el super admin que creamos antes de definiciones de redmine para agilizar procesos
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (6, 'ManageFlows' , 'Usuarios que ven todos los flujos de firma', 0) --(Administrar Flujos en Signbox)Heredado de signbox, no se usa en SaaS
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (7, 'StartFlows' , 'Iniciar flujos de firma', 0) --(Iniciar Flujos en Signbox)Heredado de signbox, no se usa en SaaS
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (8, 'ManageExpedient' , 'Usuarios que pueden ver todos los expedientes y administrarlos', 0) --(Administrar expedientes en Signbox)Heredado de signbox, no se usa en SaaS
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (9, 'ViewRepositories' , 'Usuarios que pueden ver todos los repositorios', 0) --(Ver repositorios en Signbox)Heredado de signbox, no se usa en SaaS
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (10, 'DeleteRequests' , 'Usuarios que pueden eliminar cualquier solicitud', 0) --(Eliminar solicitudes en Signbox)Heredado de signbox, no se usa en SaaS
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (11, 'DesignFlows' , 'Usuarios que sólo ven sus flujos de firma', 0) --(Diseñar flujos en Signbox)Heredado de signbox, no se usa en SaaS
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (12, 'ManageExternalUser' , 'Se puede gestionar usuarios externos a la plataforma', 0) --(Gestionar usuario externo en Signbox)Heredado de signbox, no se usa en SaaS
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (13, 'ManageDocuments' , 'Se podra administrar Documentos desde el WebApi', 0) --(Administrar Documentos en Signbox) Heredado de signbox, Se usa en SaaS, pero no aparece en el Excel. Se consulta para modificaciones de documentos. Por ejemplo, cuando se crea un documento o se elimina o documento desde la API externa se necesita este permiso
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (14, 'SuperAdministrator' , 'Podrá administrar  el sistema', 0) --Se usa en SaaS. Es un permiso comodín que solo tiene el rol "Super Admin Factum" para poder hacer todo en todas las acciones
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (15, 'ViewMyRequests' , 'Permite ver (solo lectura) todas las solicitudes en las que el usuario está involucrado', 0) --No se usa en saas. Revisar la traducción, Mad "View" o "read" que check 
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (16, 'SeeReports' , 'Permite visualizar todos los informes', 0) --Se usa en SaaS
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (17, 'ExternalAPIAccess' , 'Acceso a los métodos externos de la API', 0) --Se usa en SaaS Como flag para permitir acceso a la API Rest sin interfaz web
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (18, 'InternalAPIAccess' , 'Acceso a los métodos Internos de la API', 0) --Se usa en SaaS Como flag para permitir acceso a la interfaz web
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (19, 'CreateCompany' , 'Crear elementos pertenecientes al Empresa', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (20, 'EditCompany' , 'Modificar elementos pertenecientes al Empresa', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (21, 'UpdateAllCompanies ' , 'Modificar elementos pertenecientes al todos los Empresas', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (22, 'ViewCompany' , 'Ver elementos pertenecientes al Empresa', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (23, 'ViewAllCompanies' , 'Ver elementos pertenecientes al todos los Empresas', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (24, 'AddRolSuperAdmin' , 'Permite añadir rol SuperAdmin a un usuario', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (25, 'AddRolAdminCountry' , 'Permite añadir rol AdminPais a un usuario', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (26, 'AddRolOwner' , 'Permite añadir rol Owner a un usuario', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (27, 'AddRolAdmin' , 'Permite añadir rol Administrator a un usuario', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (28, 'AddRolSupervisor' , 'Permite añadir rol Supervisor a un usuario', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (29, 'AddRolCreator' , 'Permite añadir rol Creator a un usuario', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (30, 'CreateCompanyAllCountries' , 'Permite crear y modificar Empresas de todos los paises', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (31, 'CreateCompanyMyCountry' , 'Permite crear y modificar Empresas de su país', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (32, 'ChangeOwnEmail' , 'Permite al usuario cambiar el propio email', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (33, 'ChangeOwnerEmail' , 'Permite al usuario modificar el email de su Owner', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (34, 'ChangeAdministratorEmail' , 'Permite al usuario modificar el email de su administrator', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (35, 'ViewEmailCreatorSameCompany' , 'Permite al usuario ver el email de un creator del mismo Empresa', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (36, 'ChangeEmailCreatorSameCompany' , 'Permite al usuario modificar el email de un creator del mismo Empresa', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (37, 'EnableSignatureMethod' , 'Permite al usuario modificar el metodo de firma', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (38, 'ResetAccount' , 'Permite al usuario resetar cuentas de usuario', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (39, 'TestExtension' , 'Permite al usuario ampliar licencias de prueba', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (40, 'DeactivateAccount' , 'Permite al usuario descativar una cuenta', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (41, 'CheckStatisticalReports' , 'Permite al usuario consultar informes de estadistica', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (42, 'CheckAllReports' , 'Permite al usuario consultar todos los informes', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (43, 'UnlockAccount' , 'Permite al usuario desbloquear cuentas de usuario', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (44, 'ConfigureTypeSignatureCompany' , 'Permite al usuario configurar el tipo de firma a nivel de empresa', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (45, 'ConfigureTypeSignatureOwner' , 'Permite al usuario configurar el tipo de firma de Owner', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (46, 'ConfigureTypeSignatureAdministrator' , 'Permite al usuario configurar el tipo de firma de Administrator', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (47, 'ConfigureTypeSignatureCreator' , 'Permite al usuario configurar el tipo de firmade Creator', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (48, 'ConfigureTypeSignatureApiClient' , 'Permite al usuario configurar el tipo de firma de API Client', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (49, 'ViewDocumentsSameApiClient' , 'Permite ver los documentos pertenecientes a un apiClient', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (50, 'AssignUnassignUsersToSupervisors' , 'Permite al usuario asignar y desasignar usuarios a un supervisor', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (51, 'ChangePetitioner' , 'Permite al usuario cambiar el solicitante de una petición', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (52, 'CheckUsersReports' , 'Permite al usuario ver informes de usuarios', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (53, 'RequestRegistrationExpiredToken' , 'Permite a un usuario solicitar registro con token caducado', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (54, 'MyProfile' , 'Permite a un usuario ver su perfil', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (55, 'ManageUsers' , 'Permite a un usuario administrar todos los usuarios', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (56, 'Notifications' , 'Permite a un usuario acceder al apartado de notificaciones', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (57, 'Help' , 'Permite a un usuario acceder al apartado de ayuda', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (58, 'AboutSealSign' , 'Permite a un usuario acceder al apartado "acerca de" y condiciones de uso', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (59, 'NewRequest' , 'Permite a un usuario crear una solicitud de firma', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (60, 'Inbox' , 'Permite al usuario acceder a la bandeja de entrada', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (61, 'SentTray' , 'Permite al usuario acceder a la bandeja de enviadas', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (62, 'SentCompanyTray' , 'Permite ver el listado de solicitudes de los usuarios del Empresa', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (63, 'DeletedTray' , 'Permite a un usuario acceder a la bandeja de eliminadas', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (64, 'DraftsTray' , 'Permite a un usuario acceder a la bandeja de borradores', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (65, 'Search' , 'Permite a un usuario realizar busquedas', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (66, 'PendingCompletedBanner' , 'Permite a un usuario ver un banner con las solicitudes pendientes y completadas', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (67, 'HeaderInboxIcon' , 'Permite a un usuario ver el icono de bandeja de entrada en la cabecera', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (68, 'HeaderNotificationsIcon' , 'Permite a un usuario ver el icono de notificaciones en la cabecera', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (69, 'HeaderProfileIcon' , 'Permite a un usuario ver el icono del perfil del usuario en la cabecera', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (70, 'HeaderHelpIcon' , 'Permite a un usuario ver el acceso a ayuda', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (71, 'HeaderAboutSealSignIcon' , 'Permite a un usuario ver el acceso a condiciones de uso', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (72, 'HeaderLogoutIcon' , 'Permite a un usuario ver el acceso a cerrar sesion', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (73, 'NoticeSignatureLimitsByCompany' , 'Permite configurar los avisos de limites de firmas', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (74, 'NoticeGBLimitsByCompany' , 'Permite configurar los avisos por limite de almacenamiento', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (75, 'NoticeTemplateLimitsByCompany' , 'Permite configurar los avisos por limites de plantillas', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (76, 'MessageOfferSuperiorPackage' , 'Permite la visualizacion de mensaje de paquete superior', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (77, 'BillingMessagesExcessSignatures' , 'Permite la visualizacion de mensaje por facturacion de exceso de firmas', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (78, 'BillingMessagesExcessGB' , 'Permite la visualizacion de mensaje por facturación de exceso de almacenamiento', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (79, 'BillingMessagesExcessTemplates' , 'Permite la visualizacion de mensaje por facturación de exceso de plantillas', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (80, 'BlockingSignatureProcessesByLimit8025Percent' , 'Permite configurar el bloqueo de procesos de firmas cuando se alcance el 125% del limite', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (81, 'MessageEndLicense' , 'Permite la visualizacion de mensaje de fin de licencia', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (82, 'BlockingSignatureProcessesByEndLicense' , 'Permite el bloqueo de procesos de firma por fin de licencia', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (83, 'ChangeCompanyLimits' , 'Permite modificar los limites del Empresa', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (84, 'CheckCompanyLimits' , 'Permite la visualizacion de limites del Empresa', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (85, 'ChangeOperationsTeamDataByCompany' , 'Permite modificar el equipo de operaciones del Empresa', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (86, 'CheckOperationsTeamDataByCompany' , 'Permite la visualizacion de los equipos de operaciones', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (87, 'ChangeCommercialDataByCompany' , 'Permite la modificacion del comercial del Empresa', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (88, 'CheckCommercialDataByCompany' , 'Permite la visualizacion de datos del comercial del Empresa', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (89, 'ControlLicensesAndPayments' , 'Permite el control de licencias y pagos', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (90, 'HeaderAdministration' , 'Crear elementos pertenecientes al Empresa', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (91, 'SaveSmtpConfiguration' , 'Permite al usuario modificar los datos de SMTP de la empresa', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (92, 'ManageMyUsers' , 'Permite a un usuario administrar usuarios de la empresa a la que pertenece', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (93, 'ManageMyUser' , 'Permite a un usuario ver/editar sus propios datos', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (94, 'DownloadAllDocuments' , 'Permite a un usuario descargar todos los documentos', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (95, 'DownloadAllMyCompanyDocuments' , 'Permite a un usuario descargar todos los documentos de su empresa', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (96, 'AddRolAplicationAPI ' , 'Permite asignar el rol Aplication API a un usuario', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (97, 'ExternalOTPSignature' , 'Permite a un usuario realizar firmas OTP usando la API', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (98, 'AddRolExternalSignatory' , 'Permite a un usuario añadir el rol de Firmante externo', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (99, 'HeaderBackgroundTask' , 'Ver Botón de BackgroundTask', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (100, 'BackgroundTask' , 'Ver Background Task', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (101, 'MultiSignRequest' , 'Utilizar multirequest', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (102, 'Statistics' , 'Ver estadísticas de cualquier empresa', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (103, 'MyStatistics' , 'Ver estadísticas de la empresa a la que pertenece', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (104, 'CreateMessages' , 'Crear mensajes/notificaciones', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (105, 'CreateVersionInfo' , 'Crear info de nuevas versiones', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (106, 'CheckVersionInfo' , 'Visualizar la información de las versiones de la plataforma', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (107, 'ViewLicenseData' , 'Visualizar datos de mi licencia', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (108, 'MasterData' , 'Permite ver los datos maestros de la plataforma', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (109, 'ViewAllLicenses' , 'Permite ver el listado de las licencias disponibles', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (110, 'AccessToHeco' , 'Permiso AdHoc para entrar en los métodos especificos de Heco', 0) 
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (111, 'GenerateOTP' , 'Generar codigo OTP para external API', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (112, 'VerifyOTP' , 'Verificar codigo OTP para external API', 0) --
INSERT [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (113, 'ManageOtpLogin' , 'Permite configurar el doble factor para login desde la seccion empresa', 0) --
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (114, 'AddRolExternalOTP', 'Permite añadir rol ExternalOTP a un usuario', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (115, 'AddRolAccesoAPIHeco', 'Permite añadir rol Acceso API Heco a un usuario', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (116, 'AddRolRegisteredSignatory', 'Permite añadir rol Registered signatory a un usuario', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (117, 'AddRolUnregisteredSignatory', 'Permite añadir rol Unregistered signatory a un usuario ', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (118, 'AddRolAplicationAPISinPermisos', 'Permite añadir rol Aplication API sin permisos a un usuario', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (119, 'ManageFlowTemplatesTenant', 'Permite guardar plantillas de flujo para la empresa', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (120, 'ManageFlowTemplatesUser', 'Permite guardar plantillas de flujo para el usuario', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (121, 'ViewFlowTemplates', 'Permite visualizar plantillas de flujo', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (122, 'ManageRequestTemplatesTenant', 'Permite guardar plantillas de solicitud para la empresa', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (123, 'ManageRequestTemplatesUser', 'Permite guardar plantillas de solicitud para el usuario', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (124, 'ViewRequestTemplates', 'Permite visualizar plantillas de solicitud', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (125, 'QualifiedDeliveryManager', 'Gestor de Entrega Cualificada', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (126, 'EditRecipients', 'Permite editar los datos de los recipientes que están sin completar', 0);
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (127, 'UseQualifiedDelivery', 'Entrega Cualificada', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (128, 'ManageUserQualifiedDelivery', 'Administrador Entrega Cualificada', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (129, 'AllowExternalEmailSender', 'Permite mandar correos mediante el api externo de SaaS', 0)
insert into [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) values (130,'AddRolOwnerEc','Permite añadir rol OwnerEC a un usuario',0)
insert into [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) values (131,'AddRolCreatorEc','Permite añadir rol CreatorEC a un usuario',0)
insert into [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) values (132,'AddRolOwnerEcSaaS','Permite añadir rol OwnerSaaS_EC a un usuario',0)
insert into [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) values (133,'AddRolCreatorEcSaaS','Permite añadir rol CreatorSaaS_EC a un usuario',0) 
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (134, 'UpdateLogo', 'Permite a un usuario actualizar el logo por api externa. Para api interna está contenido en el mismo tenant y se usa el permiso EditCompany', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (135, 'UpdateReminders', 'Permite a un usuario actualizar los recordatorios por api externa. Para api interna está contenido en el mismo tenant y se usa el permiso EditCompany', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (136, 'ManageWidgetTemplates', 'Permite administrar los FormWidgetTemplates del paso 3 de configuracion de request', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (137, 'ManageServerSign', 'Permite activar o desactivar la firma con certificado servidor en un tenant ', 0)
INSERT INTO [dbo].[SignPermissions] ([ID], [Name], [Description], [SystemAdmin]) VALUES (138, 'ManageMyCertificates', 'Permite gestionar (añadir, eliminar, usar) tus propios certificados en Sealsign', 0)


INSERT [dbo].[PermissionsGroupsMaster] ([ID], [Name], [Description], [Enabled]) VALUES (1, N'TenantAllowed', N'Grupo de permisos involucrados en la creación de tenants', 1)
GO
INSERT [dbo].[PermissionsGroupsMaster] ([ID], [Name], [Description], [Enabled]) VALUES (2, N'RolesAllowed', N'Grupo de permisos involucrados en la asignación de roles a usuarios', 1)
GO
INSERT [dbo].[PermissionsGroupsMaster] ([ID], [Name], [Description], [Enabled]) VALUES (3, N'RequestAllowed', N'Grupo de permisos involucrados en la interacción con solicitudes', 1)
GO



INSERT INTO [dbo].[PermissionsGroups] ([IDSignPermissions], [IDPermissionsGroupMaster]) VALUES (19, 1)
INSERT INTO [dbo].[PermissionsGroups] ([IDSignPermissions], [IDPermissionsGroupMaster]) VALUES (20, 1)
INSERT INTO [dbo].[PermissionsGroups] ([IDSignPermissions], [IDPermissionsGroupMaster]) VALUES (24, 2)
INSERT INTO [dbo].[PermissionsGroups] ([IDSignPermissions], [IDPermissionsGroupMaster]) VALUES (26, 2)
INSERT INTO [dbo].[PermissionsGroups] ([IDSignPermissions], [IDPermissionsGroupMaster]) VALUES (27, 2)
INSERT INTO [dbo].[PermissionsGroups] ([IDSignPermissions], [IDPermissionsGroupMaster]) VALUES (28, 2)
INSERT INTO [dbo].[PermissionsGroups] ([IDSignPermissions], [IDPermissionsGroupMaster]) VALUES (29, 2)
INSERT INTO [dbo].[PermissionsGroups] ([IDSignPermissions], [IDPermissionsGroupMaster]) VALUES (1, 3)
INSERT INTO [dbo].[PermissionsGroups] ([IDSignPermissions], [IDPermissionsGroupMaster]) VALUES (2, 3)
INSERT INTO [dbo].[PermissionsGroups] ([IDSignPermissions], [IDPermissionsGroupMaster]) VALUES (3, 3)
INSERT INTO [dbo].[PermissionsGroups] ([IDSignPermissions], [IDPermissionsGroupMaster]) VALUES (15, 3)


INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 1)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 2)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 3)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 15)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 18)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 35)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4,36)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 54)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 56)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 57)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 58)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 59)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 60)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 61)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 63)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 64)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 65)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 66)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 67)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 68)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 69)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 70)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 71)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 72)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 80)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 81)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 82)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 90)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 93)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 99)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 100)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 101)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 106)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 107)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 108)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID],[SignPermissions_ID]) VALUES (4,120)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 121)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 123)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 124)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 126)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (4, 138)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 18)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 19)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 20)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 21)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 22)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 23)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 24)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 26)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 30)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 37)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 39)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 41)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 44)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 54)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 55)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 56)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 57)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 58)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 70)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 71)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 72)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 73)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 74)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 75)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 83)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 84)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 85)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 86)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 87)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 88)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 89)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 90)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 93)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 94)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 96)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 102)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 106)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 107)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 108)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 109)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 100)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (1, 99)
Insert into [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) values (1,130)
Insert into [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) values (1,131)
Insert into [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) values (1,132)
Insert into [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) values (1,133)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 1)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 2)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 3)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 15)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 18)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 20)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 22)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 29)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 32)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 33)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 34)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 35)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 36)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 38)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 40)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 42)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 43)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 45)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 46)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 47)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 48)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 50)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 51)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 52)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 54)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 56)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 57)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 58)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 59)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 60)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 61)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 62)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 63)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 64)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 65)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 66)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 67)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 68)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 69)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 70)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 71)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 72)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 73)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 74)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 75)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 76)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 77)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 78)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 79)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 80)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 81)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 82)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 84)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 85)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 86)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 87)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 88)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 89)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 90)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 91)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 92)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 93)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 95)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 99)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 100)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 101)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 103)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 106)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 107)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 108)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 109)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 113)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 119)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 120)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 121)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 122)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 123)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 124)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 137)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 138)
Insert into [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) values (2,130)
Insert into [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) values (2,131)
Insert into [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) values (2,132)
Insert into [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) values (2,133)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (2, 126)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 14)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 18)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 19)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 20)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 21)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 22)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 23)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 24)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 25)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 26)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 27)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 28)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 29)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 30)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 37)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 39)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 41)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 42)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 44)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 55)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 56)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 57)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 58)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 70)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 71)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 72)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 73)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 74)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 75)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 83)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 84)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 85)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 86)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 87)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 88)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 89)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 90)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 91)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 93)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 94)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 98)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 102)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 104)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 105)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 106)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 107)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 108)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 113)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 114)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 115)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 116)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 117)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (10, 118)
Insert into [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) values(10,130)
Insert into [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) values(10,131)
Insert into [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) values(10,132)
Insert into [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) values(10,133)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (13, 111)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (13, 112)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (13, 17)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (11, 97)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (11, 18)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (11, 107)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (11, 108)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 1)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 2)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 3)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 15)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 17)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 35)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 56)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 57)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 58)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 59)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 60)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 61)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 63)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 64)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 65)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 66)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 67)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 68)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 69)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 70)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 71)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 72)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 80)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 81)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 82)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 93)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 107)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 108)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 91)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 134)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (8, 135)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (14, 121)
 INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (14, 129)--AllowExternalEmailSender
 INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (14, 17)--Permite el acceso a la API Rest Sin Web SaaS
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 1)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 2)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 3)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 15)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 17)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 35)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 56)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 57)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 58)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 59)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 60)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 61)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 63)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 64)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 65)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 66)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 67)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 68)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 69)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 70)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 71)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 72)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 80)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 81)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 82)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 93)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 107)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 108)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (12, 110)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (15, 127)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (16, 127)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (16, 128)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (16, 129)--Permite mandar correos mediante el api externo de SaaS
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (16, 130)--Permite añadir rol OwnerEC a un usuario
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (16, 131)--Permite añadir rol CreatorEC a un usuario
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (16, 132)--Permite añadir rol OwnerSaaS_EC
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (16, 133)--Permite añadir rol CreatorSaaS_EC a un usuario
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 1)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 2)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 3)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 15)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 18)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 35)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 54)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 56)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 57)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 58)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 59)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 60)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 61)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 63)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 64)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 65)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 66)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 67)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 68)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 69)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 70)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 71)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 72)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 80)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 81)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 82)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 90)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 93)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 99)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 100)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 101)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 106)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 107)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 108)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 120)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 121)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 123)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 124)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 126)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (17, 127)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 1)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 2)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 3)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 15)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 18)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 20)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 22)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 29)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 32)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 33)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 34)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 35)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 36)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 38)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 40)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 42)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 43)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 45)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 46)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 47)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 48)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 50)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 51)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 52)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 54)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 56)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 57)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 58)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 59)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 60)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 61)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 62)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 63)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 64)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 65)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 66)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 67)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 68)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 69)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 70)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 71)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 72)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 73)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 74)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 75)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 76)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 77)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 78)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 79)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 80)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 81)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 82)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 84)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 85)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 86)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 87)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 88)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 89)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 90)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 91)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 92)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 93)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 95)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 99)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 100)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 101)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 103)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 106)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 107)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 108)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 109)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 113)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 119)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 120)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 121)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 122)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 123)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 124)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 126)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 127)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (18, 128)
Insert into [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) values(18,130)
Insert into [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) values(18,131)
Insert into [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) values(18,132)
Insert into [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) values(18,133)
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19,16) -- SeeReports
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19,18) -- InternalAPIAccess
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 22) -- ViewCompany
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 35) -- ViewEmailCreatorSameCompany
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 41)  -- CheckStatisticalReports
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 49) -- ViewDocumentsSameApiClient
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 52) -- CheckUsersReports
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 54) -- CheckUsersReports
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 56) -- Notifications
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 57) -- Help
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 58) -- AboutSealSign
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 60) -- Inbox
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 61) -- SentTray
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 63) -- DeletedTray
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 64) -- DraftsTray
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 65) -- Search
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 66) --PendingCompletedBanner
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 67) --HeaderInboxIcon
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 68) -- HeaderNotificationsIcon
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 69) -- HeaderProfileIcon
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 70) -- HeaderHelpIcon
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 71) -- HeaderAboutSealSignIcon
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 72) -- HeaderLogoutIcon
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 76) -- MessageOfferSuperiorPackage
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 81) -- MessageEndLicense
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 88) -- CheckCommercialDataByCompany
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 90) -- HeaderAdministration
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 93) -- ManageMyUser
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 94) -- DownloadAllDocuments
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 99) -- HeaderBackgroundTask
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 100) -- BackgroundTask
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 103) -- MyStatistics
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 106) -- CheckVersionInfo
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 107) -- ViewLicenseData
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 108) -- MasterData
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 121) -- ViewFlowTemplates
INSERT INTO [dbo].[RolesPermissions] ([Roles_ID] ,[SignPermissions_ID]) VALUES (19, 124) -- ViewRequestTemplates

--ROLLBACK
COMMIT