iOS-JSON-Login
==============

Simple iOS JSON login app and web code


### Mysql
The SQL the create the Mysql table is as follows.

```sql
CREATE TABLE IF NOT EXISTS `users3` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;
```

### Web App Changes

To use this code simply replace the variables within qoutes with the apprpriate values for your server
```php
$user = "USERNAME";
$pass = "PASSWORD";
$database = "DATABASE";
$salt = "SALT";
```

### App Changes

To use the iOS App change the following lines of code respectively

```objectivec
NSString *salt = @"YOURSALT";
```

```objectivec
NSString *url = [NSString stringWithFormat: @"http://YOURSERVERURL/login.php?username=%@&password=%@", test_username, test_password];
```
