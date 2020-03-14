package = "recipient-validation"
version = "dev-1"
source = {
   url = "git+https://github.com/SparkPost/code-snippets.git"
}
description = {
   summary = "# [Recipient Validation Examples](/snippets/recipient-validation)",
   detailed = "# [Recipient Validation Examples](/snippets/recipient-validation)",
   homepage = "https://github.com/SparkPost/code-snippets",
   license = "*** please specify a license ***"
}
build = {
   type = "builtin",
   modules = {
       validateRecipient = "validateRecipient.lua"
   },
   install = {
      bin = {
         "bin/Debug"
      }
   }
}
