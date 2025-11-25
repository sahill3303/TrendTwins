# TrendTwins

**TrendTwins** — Search and compare first-copy products aggregated from selected vendors.
Built with: JSP, Servlets, JDBC, MySQL, Apache Tomcat, n8n (for scraping).

## Features
- Search products using text
- Aggregated product listings
- Admin dashboard with site stats
- Click tracking and export to CSV

## Setup (local)
1. Clone repo:
   `git clone https://github.com/yourusername/TrendTwins.git`
2. Open in Eclipse (Enterprise):
   `File -> Import -> Existing Projects into Workspace`
3. Add MySQL JDBC driver to `WEB-INF/lib`
4. Create `trendtwins` DB and run SQL in `db/sql/` (list of tables)
5. Configure DB credentials in `src/main/webapp/db.jsp`
6. Run on Tomcat at http://localhost:8082/TrendTwins/

## Admin
- default admin: `admin` / `admin123`

## Notes
- Make sure `product_clicks` and `site_stats` tables are present.
