/* libocsppq - perform OCSP checks from a PostgreSQL function
 * Written by Rob Stradling
 * Copyright (C) 2017 COMODO CA Limited
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

CREATE OR REPLACE FUNCTION ocsp_embedded(
	cert					bytea,
	issuer_cert				bytea
) RETURNS text
AS $$
BEGIN
	RETURN ocsp_check(encode(cert, 'base64'), encode(issuer_cert, 'base64'));
END;
$$ LANGUAGE plpgsql STRICT;
