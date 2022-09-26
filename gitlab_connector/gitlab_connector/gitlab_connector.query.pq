﻿// This is where you can write sample queries to test your extension.
let
    source = gitlab_connector.Contents("https://gitlab.com/api/v4/projects")
in
    source