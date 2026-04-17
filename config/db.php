<?php

class Database {
    private static ?PDO $instance = null;
    private const HOST = 'localhost';
    private const DBNAME = 'capstone_project'; // Adjust to your database name
    private const USER = 'root';
    private const PASS = '';
    private const CHARSET = 'utf8mb4';

    private function __construct() {}
    private function __clone() {}
    public function __wakeup() {}

    public static function getInstance(): PDO {
        if (self::$instance === null) {
            // Use environment variables with fallbacks for backward compatibility
            $host = getenv('DB_HOST') ?: self::HOST;
            $dbname = getenv('DB_NAME') ?: self::DBNAME;
            $user = getenv('DB_USER') ?: self::USER;
            $pass = getenv('DB_PASS') ?: self::PASS;
            $charset = self::CHARSET;

            $dsn = sprintf('mysql:host=%s;dbname=%s;charset=%s', $host, $dbname, $charset);

            try {
    // TiDB Serverless requires SSL. 
    // On most Linux environments (like Render), the default CA bundle is at this path:
    $ssl_ca = '/etc/ssl/certs/ca-certificates.crt';

    self::$instance = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        // CRITICAL: Add these two lines for TiDB Cloud
        PDO::MYSQL_ATTR_SSL_CA => $ssl_ca,
        PDO::MYSQL_ATTR_SSL_VERIFY_SERVER_CERT => false, 
    ]);
    
    self::$instance->exec("SET SESSION group_concat_max_len = 1000000");
} catch (PDOException $e) {
                http_response_code(500);
                header('Content-Type: application/json');
                echo json_encode(['error' => 'Database connection failed', 'details' => $e->getMessage()]);
                exit;
            }
        }

        return self::$instance;
    }
}
