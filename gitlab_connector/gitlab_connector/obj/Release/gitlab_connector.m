// This file contains your Data Connector logic
section gitlab_connector;

    client_id       = Json.Document ( Extension.Contents( "WebApp.json") ) [web][client_id];
    client_secret   = Json.Document ( Extension.Contents( "WebApp.json") ) [web][client_secret];
    //#token_uri       = Json.Document ( Extension.Contents( "WebApp.json") ) [web][token_uri];
    //#authorize_uri   = Json.Document ( Extension.Contents( "WebApp.json") ) [web][authorize_uri];

    redirectUrl = "https://oauth.powerbi.com/views/oauthredirect.html";

    windowWidth = 1080;
    windowHeight = 1024;

    baseUrl = "https://gitlab.com/";
    scope_prefix = "";
scopes = {
	"manage_pages", "instagram_basic", "instagram_manage_insights"
};

[DataSource.Kind="gitlab_connector", Publish="gitlab_connector.Publish"]
shared gitlab_connector.Contents = (optional message as text) =>
    let
        _message = if (message <> null) then message else "(no message)",
        a = "Hello from gitlab_connector: " & _message
    in
        a;

// Data Source Kind description
gitlab_connector = [
    Authentication = [
        // Key = [],
        // UsernamePassword = [],
        // Windows = [],
        Implicit = []
    ],
    Label = Extension.LoadString("DataSourceLabel")
];

// Data Source UI publishing description
gitlab_connector.Publish = [
    Beta = true,
    Category = "Other",
    ButtonText = { Extension.LoadString("ButtonTitle"), Extension.LoadString("ButtonHelp") },
    LearnMoreUrl = "https://powerbi.microsoft.com/",
    SourceImage = gitlab_connector.Icons,
    SourceTypeImage = gitlab_connector.Icons
];

gitlab_connector.Icons = [
    Icon16 = { Extension.Contents("gitlab_connector16.png"), Extension.Contents("gitlab_connector20.png"), Extension.Contents("gitlab_connector24.png"), Extension.Contents("gitlab_connector32.png") },
    Icon32 = { Extension.Contents("gitlab_connector32.png"), Extension.Contents("gitlab_connector40.png"), Extension.Contents("gitlab_connector48.png"), Extension.Contents("gitlab_connector64.png") }
];
