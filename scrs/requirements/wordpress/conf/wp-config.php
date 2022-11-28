<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', DATABASE_NAME );

/** Database username */
define( 'DB_USER', DATABASE_LOGIN );

/** Database password */
define( 'DB_PASSWORD', DATABASE_PASSWORD );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'v-*PrnjMfPeO[+tEMtNktGHjZ?^bW`g6E|1!lZ5$J{k+[t(|Iwgnjelj|--o@#qb');
define('SECURE_AUTH_KEY',  'K;{]++wF>1{pVZ$tR+-8R/CRwc+IV9*-mj=K<4y6ojK>yPou&y7K!)hmWA/|W6&;');
define('LOGGED_IN_KEY',    'eliC.v[S;N|Y|Dfwu=Xee0I1F2DaL%X,i^N0DdIL;MD/fz;^|rd$qi]?/U]_T<|=');
define('NONCE_KEY',        'nNT%Z;:w5bm]>1$pF2~Uh~+]&}qg]mP,Dx$xRg<k,H?,?m;hpq6o`.-V7|TV:|6{');
define('AUTH_SALT',        'q+p1bAf+;JW(nV.g%:isC)k%3QXD@$VfkilFzbZpS.130]7:&e%o8k@ Zj+M`tFq');
define('SECURE_AUTH_SALT', 'Z23C)zMI&.e[g|4-@$ERMJX;v{2>>+n>~ef:sl7^3wAB:w;EfqrJ1t//F-*-BvWb');
define('LOGGED_IN_SALT',   'kK6,!wBGwk%^E-<kzC-!|>(~?$Gp)H4Tc_Ss6+EwO?Zxx<0fU,8bA[6*VIn+6&@]');
define('NONCE_SALT',       'W9C&lqCF7d*Iy9HTSC?5s75JkYKf:p^7xNGzC6aql48O;a[C6-= ?5{FGkxjd6b$');
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */

define('WP_ALLOW_REPAIR', true);

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

