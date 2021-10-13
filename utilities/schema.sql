CREATE SCHEMA IF NOT EXISTS bcdi;

CREATE SEQUENCE IF NOT EXISTS district_sequence_id;

CREATE TABLE bcdi.districts (
	"id" int4 NOT NULL DEFAULT nextval('district_sequence_id'::regclass),
	"district_id" int4,
	"name" text NOT NULL,
	"created_at" timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("id")
);

INSERT INTO bcdi.districts (district_id, name) VALUES (8, 'Ayala');
INSERT INTO bcdi.districts (district_id, name) VALUES (11, 'Dinowitz');
INSERT INTO bcdi.districts (district_id, name) VALUES (12, 'Riley');
INSERT INTO bcdi.districts (district_id, name) VALUES (13, 'Gjonaj');
INSERT INTO bcdi.districts (district_id, name) VALUES (14, 'Cabrera');
INSERT INTO bcdi.districts (district_id, name) VALUES (15, 'Feliz');
INSERT INTO bcdi.districts (district_id, name) VALUES (16, 'Gibson');
INSERT INTO bcdi.districts (district_id, name) VALUES (17, 'Salamanca Jr.');
INSERT INTO bcdi.districts (district_id, name) VALUES (18, 'Ruben Diaz Sr.');
INSERT INTO bcdi.districts (name) VALUES ('NYC - prefer not to say');
INSERT INTO bcdi.districts (name) VALUES ('Outside NYC');

CREATE SEQUENCE IF NOT EXISTS category_sequence_id;

CREATE TABLE bcdi.categories (
	"id" int4 NOT NULL DEFAULT nextval('category_sequence_id'::regclass),
	"name" text NOT NULL,
	"descriptive_html" text NOT NULL,
	"amount" numeric NOT NULL,
	"context_amount_1" text,
	"context_description_1" text,
	"context_amount_2" text,
	"context_description_2" text,
	"context_amount_3" text,
	"context_description_3" text,
	"created_at" timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("id")
);

INSERT INTO bcdi.categories (
	name,
	amount,
	descriptive_html,
	context_amount_1,
	context_description_1,
	context_amount_2,
	context_description_2
) VALUES (
	'Education',
	 30000000000.00,
	 '<p>The <a href="https://www.schools.nyc.gov/" target="_blank"rel="noreferrer noopener">Department of Education (DOE)</a> funds public and charter schools, prekindergarten programs, and afterschool care (sports, music, other educational programming).</p>',
	 '$10 million',
	 'One year of school supplies for ~14,000 students',
	 '$100 million',
	 '~2.5 months of funding for universal pre-K'
);

INSERT INTO bcdi.categories (
	name,
	amount,
	descriptive_html,
	context_amount_1,
	context_description_1,
	context_amount_2,
	context_description_2
) VALUES (
	'CUNY',
	 1000000000.00,
	 '<p> Education spending also includes funding for the system of 25 colleges across the City that make up <a href="https://www.cuny.edu/" target="_blank" rel="noreferrer noopener">City University of New York</a> (CUNY).</p>',
	 '$10 million',
	 'Average financial aid for ~1,150 first-year students at CUNY-Queens College',
	 '$100 million',
	 '4-years, free in-state tuition for ~3,607 students'
);

INSERT INTO bcdi.categories (
	name,
	amount,
	descriptive_html,
	context_amount_1,
	context_description_1,
	context_amount_2,
	context_description_2
) VALUES (
	'Social Services',
	 17000000000.00,
	 '<p>Social Services spending includes funding a number of City agencies that provide human services and assistance. Included in this category are the budgets for <a href="https://www1.nyc.gov/site/veterans/about/about.page" target="_blank" rel="noreferrer noopener">New York City Department of Veteran Services</a>, <a href="https://www1.nyc.gov/site/acs/about/about.page" target="_blank" rel="noreferrer noopener">Administration for Children’s Services</a> (ACS), <a href="https://www1.nyc.gov/site/dss/index.page" target="_blank" rel="noreferrer noopener">NYC Department of Social Services</a> (DSS), <a href="https://www1.nyc.gov/site/dhs/index.page" target="_blank" rel="noreferrer noopener">Department of Homeless Services</a> (DHS), <a href="https://www1.nyc.gov/site/dfta/index.page" target="_blank" rel="noreferrer noopener">Department for the Aging</a>, <a href="https://www.dnb.com/business-directory/company-profiles.new_york_city_financial_information_services_agency.07ef035f503b11f3.html" target="_blank" rel="noreferrer noopener">Financial Information Services Agency</a>, <a href="https://www1.nyc.gov/site/cchr/index.page" target="_blank" rel="noreferrer noopener">NYC Commission on Human Rights</a> and the <a href="https://www1.nyc.gov/site/dycd/index.page" target="_blank" rel="noreferrer noopener">Department on Youth and Community Development</a>. </p>',
	 '$1 million',
	 'One year of Home Energy Assistance Program funding',
	 '$10 million',
	 '213 homeless family shelter units for a year (about 1 percent of the average annual cost of sheltering families)'
);

INSERT INTO bcdi.categories (
	name,
	amount,
	descriptive_html,
	context_amount_1,
	context_description_1,
	context_amount_2,
	context_description_2
) VALUES (
	'Police & Corrections',
	 7000000000.00,
	 '<p>The <a href="https://www1.nyc.gov/site/nypd/index.page" target="_blank" rel="noreferrer noopener">Police Department of the City of New York (NYPD)</a> enforces the law, maintains public order, and investigates crimes. Spending in this category also includes funding for the <a href="https://www1.nyc.gov/site/doc/index.page" target="_blank" rel="noreferrer noopener">NYC Department of Corrections</a>. </p>',
	 '$1 million',
	 'Salary of ~5 police captains',
	 '$10 million',
	 '1.7 days of incarcerating the average daily population of 9,790 inmates in city jails'
);

INSERT INTO bcdi.categories (
	name,
	amount,
	descriptive_html,
	context_amount_1,
	context_description_1,
	context_amount_2,
	context_description_2
) VALUES (
	'General Government',
	 4000000000.00,
	 '<p>The General Government consists of the <a href="https://www1.nyc.gov/office-of-the-mayor/"  target="_blank" rel="noreferrer noopener">NYC Office of the Mayor</a> and various administrative departments in the city. It also includes <a href="https://www1.nyc.gov/site/cau/community-boards/community-boards.page" target="_blank" rel="noreferrer noopener">NYC Community Boards</a>, <a href="http://bronxboropres.nyc.gov/" target="_blank" rel="noreferrer noopener">Offices of the Borough Presidents</a>, and <a href="https://council.nyc.gov/" target="_blank" rel="noreferrer noopener">NYC City Council</a>.</p>',
	 '$1 million',
	 'One year of supplies for the office of the Manhattan borough president',
	 '$10 million',
	 'Half a year of funding for Office of Labor Relations (negotiates with labor unions)'
);

INSERT INTO bcdi.categories (
	name,
	amount,
	descriptive_html,
	context_amount_1,
	context_description_1,
	context_amount_2,
	context_description_2,
	context_amount_3,
	context_description_3
) VALUES (
	'Health and Hospitals',
	 3000000000.00,
	 '<p>The New York City <a href="https://www1.nyc.gov/site/doh/index.page" target="_blank" rel="noreferrer noopener">Department of Health and Mental Hygiene (DOH)</a> provides a range of services including health inspections, licensing and no cost health clinics as well as public health research and response. <a href="https://www.nychealthandhospitals.org/" target="_blank" ref="noreferrer noopener">New York Health + Hospital Corps (HHC)</a> is a public healthcare system that includes 11 acute hospital centers, five long term care facilities and numerous clinics providing primary and specialized care. </p>',
	 '$10 million',
	 '~6 months of funding for Office of the Chief Medical Examiner',
	 '$100 million',
	 '~4 months of funding for early intervention',
	 '$1 billion',
	 'Cost of building ~1,600,000 sq feet of new hospital space in underserved neighborhoods'
);

INSERT INTO bcdi.categories (
	name,
	amount,
	descriptive_html,
	context_amount_1,
	context_description_1,
	context_amount_2,
	context_description_2
) VALUES (
	'Sanitation',
	 2000000000.00,
	 '<p>The <a href="https://www1.nyc.gov/assets/dsny/site/home" target="_blank" rel="noreferrer noopener">NYC Department of Sanitation (DSNY)</a> is the world’s largest sanitation department. DSNY collects more than 10,500 tons of residential and institutional garbage and 1,760 tons of the recyclables – each day. While efficiently managing solid waste and clearing litter or snow from 6,300 miles of streets, the Department is also a leader in environmentalism — committing to sending zero waste to landfills.</p>',
	 '$1 million',
	 'Disposal of trash produced by New Yorkers in ~1 day',
	 '$10 million',
	 '9 days of disposal of residential garbage'
);

INSERT INTO bcdi.categories (
	name,
	amount,
	descriptive_html,
	context_amount_1,
	context_description_1,
	context_amount_2,
	context_description_2,
	context_amount_3,
	context_description_3
) VALUES (
	'Environmental Protection',
	 1500000000.00,
	 '<p>The <a href="https://www1.nyc.gov/site/dep/index.page" target="_blank" ref="noreferrer noopener">Department of Environmental Protection (DEP)</a> is responsible for upkeep of water mains and sewers and conducting projects to ensure water quality and conservation as well as control water pollution. DEP  works with multiple City agencies to construct, install, and maintain various green Infrastructure projects for stormwater capture. The department works to supply clean drinking water, collects and treats wastewater, and reduces air, noise, and hazardous substances pollution. </p>',
	 '$1 million',
	 'Green retrofitting of ~288 average-sized NY apartments',
	 '$10 million',
	 '9.7 billion gallons of wastewater treated (about 2 percent of wastewater treated annually)',
	 '$100 million',
	 '~1 year of heat, light, and power for the department'
);

INSERT INTO bcdi.categories (
	name,
	amount,
	descriptive_html,
	context_amount_1,
	context_description_1,
	context_amount_2,
	context_description_2
) VALUES (
	'Housing and Urban Development',
	1500000000.00,
	'<p>The <a href="https://www1.nyc.gov/site/hpd/about/about-hpd.page" target="_blank" rel="noreferrer noopener">Department of Housing Preservation and Development (HPD)</a> promotes the quality and affordability of the city''s housing and the strength and diversity of its many neighborhoods. The agency preserves and builds affordable housing and protects tenants. It enforces the building code and engages in neighborhood planning. The <a href="https://www1.nyc.gov/site/planning/about/department.page" target="_blank" rel="noreferrer noopener">Department of City Planning (DCP)</a> is New York City’s primary land use agency and is instrumental in designing the City’s physical and socioeconomic framework. This budget line also includes funding for the New York City <a href="https://www1.nyc.gov/site/buildings/index.page" target="_blank" rel="noreferrer noopener">Department of Buildings (DOB)</a> and the <a href="https://www1.nyc.gov/site/lpc/index.page" target="_blank" rel="noreferrer noopener">Landmarks Preservation Commission</a> that protects New York City''s architecturally, historically, and culturally significant buildings and sites by granting them landmark or historic district status, and regulating them after designation.</p>',
	'$1 million',
	'Annual rent for about 155 one-bedroom affordable housing units',
	'$10 million',
	'Office of Housing Preservation general maintenance and repair for one year'
);

INSERT INTO bcdi.categories (
	name,
	amount,
	descriptive_html,
	context_amount_1,
	context_description_1,
	context_amount_2,
	context_description_2
) VALUES (
	'Libraries, Recreation, Culture',
	 1000000000.00,
	 '<p>The <a href="https://www1.nyc.gov/site/dcla/index.page" target="_blank" rel="noreferrer noopener">Department of Cultural Affairs</a> (DCLA), and <a href="https://www.nycgovparks.org/" target="_blank" rel="noreferrer noopener">Departments of Parks and Recreation</a>, maintain and promote museum and cultural institutions, public parks, community programs, and other neighborhood- strengthening services. With nearly 53 million items and 92 locations, the <a href="https://www.nypl.org/" target="_blank" rel="noreferrer noopener">New York Public Library</a> is the second largest public library in the United States and the third largest in the world. Libraries allow people to borrow books and other materials, have access to wifi and technology (such as computers and printers). They provide assistance through workshops, public programming and research services.</p>',
	 '$1 million',
	 'NYPL consulting services for about one year',
	 '$10 million',
	 '952 summer pool and beach season lifeguards (68 percent of seasonal lifeguards)'
);

CREATE SEQUENCE IF NOT EXISTS budget_sequence_id;

CREATE TABLE bcdi.budget (
	"id" int4 NOT NULL DEFAULT nextval('budget_sequence_id'::regclass),
	"submission_id" text NOT NULL,
	"district_id" int4,
	"zip_code" numeric,
	"budget_familiarity" int1,
	"category_id" int4 NOT NULL,
	"category_value" numeric NOT NULL,
	"created_at" timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "district_constraint_id" FOREIGN KEY ("district_id") REFERENCES "bcdi"."districts"("id") ON DELETE CASCADE,
	CONSTRAINT "category_constraint_id" FOREIGN KEY ("category_id") REFERENCES "bcdi"."categories"("id") ON DELETE CASCADE,
	PRIMARY KEY ("id")
)
