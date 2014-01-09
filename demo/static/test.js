var    WEBSQL_DB_NAME = location.hostname;
var    WEBSQL_TATBLE_NAME = 'fis_bigpipe_cache';

var Websql = {
        getItem : function(id, cb){
            var conn = openDatabase(WEBSQL_DB_NAME, '1.0', "", 5 * 1024 * 1024);
            conn.transaction(function(tx){
               tx.executeSql('SELECT * FROM ' + WEBSQL_TATBLE_NAME + ' WHERE id=?', [id],
                function(tx, result){
                    if(result.rows.length > 0){
                      cb(null, result.rows.item(0));
                    }else{
                      cb(null, null);
                    }
                }, 
                function(tx, err){
                    tx.executeSql('CREATE TABLE IF NOT EXISTS ' + WEBSQL_TATBLE_NAME +'(id TEXT NOT NULL PRIMARY KEY, value TEXT)', [], 
                        function(tx, result){
                            cb(null);
                        },
                        function(tx, err){
                            cb(err);
                        });
                });
            });
        },
        setItem : function(id, content, cb){
            var conn = openDatabase(WEBSQL_DB_NAME, '1.0', "", 5 * 1024 * 1024);
            conn.transaction(function(tx) {
               tx.executeSql('INSERT OR REPLACE INTO ' + WEBSQL_TATBLE_NAME + '(id, value) VALUES (?, ?)', [id, content],
                  function(tx, result){
                      cb(null, result);
                  },
                  function(tx, err){
                      cb(err);
                  }
               );
            });
        }
    };