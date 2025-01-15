SELECT
	auth.email AS email,
	auth.password AS password,
	auth.role AS role_id,
	roles.name AS role_name,
	users.name AS user_name
FROM
	authentications auth
	INNER JOIN
		roles
	ON
		auth.role = roles.id
	INNER JOIN
		users
	ON
		auth.email = users.email
WHERE
	auth.email = 'user00@example.com'
	AND
	auth.password = 'pass00';

