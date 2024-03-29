const db = require("../../utilities/postgres").instance;
const pgp = require("pg-promise")(/*initOptions*/);
import { nanoid } from "nanoid";
import {
  BRONX_COUNCIL_DISTRICTS,
  BRONX_FY2022_BUDGET
} from "../../utilities/constants.js";


const getId = () => nanoid(12);

// for DB interaction
async function handleGet(request, response) {
  // this is not used
};

async function handlePost(request, response) {
  const submission_id = getId();
  let valuesToSubmit = [];
  const submissionContent = Object.keys(request.body.budgetValues).map((category_id) => {
    if (!request.body.budgetFamiliarity || !request.body.zipCode || !request.body.district) {
      if (valuesToSubmit.length == 0) {
        valuesToSubmit = ['submission_id', 'category_id', 'category_value'];
      }
      return {
        submission_id: submission_id,
        category_id: category_id,
        category_value: request.body.budgetValues[category_id]
      }
    } else {
      if (valuesToSubmit.length == 0) {
        valuesToSubmit = ['submission_id', 'district_id', 'zip_code', 'budget_familiarity', 'category_id', 'category_value']
      }
      return {
        submission_id: submission_id,
        district_id: request.body.district,
        zip_code: request.body.zipCode,
        budget_familiarity: request.body.budgetFamiliarity,
        category_id: category_id,
        category_value: request.body.budgetValues[category_id]
      }
    }
  });
  const insert = pgp.helpers.insert(
    submissionContent,
    valuesToSubmit,
    'bronx.budget'
  ).replace('"bronx.budget"', "bronx.budget");
  const query = await db.any(insert);
  response.status(200).json(query);
};


export default function handler(req, res) {
  const { method } = req;
  // console.log(method);
  switch (method) {
    case "GET": {
      // not used
    }
    case "POST": {
      handlePost(req, res);
      break;
    }
    case "PUT": {
      // not used
      break;
    }
  }
};
