import React from 'react';
import Image from 'next/image';
import bronxDots from '../../../static/bronx_dots.png';
import CallToAction from '../../callToAction/CallToAction.js';
import styles from './Primary.module.scss';
export default function Primary() {

  return (
    <article className={styles.container} id={"about-this"}>
      <div className={styles.left}>
        <h1>{"About the Project"}</h1>
        <p>{"The Bronx People’s Budget Survey is part of the work of "}<a href='https://bcdi.nyc/bronxwideplan' target='_blank' rel='noreferrer'>{"the Bronx-wide Coalition"}</a>{" to establish a community driven, comprehensive vision for economic development grounded in racial justice and economic democracy in our borough and city."}</p>
        <CallToAction
          text={"Read More"}
          path={"/about"}
          type={"button-splash"}/>
    </div>
      <div className={styles.right}>
        <Image src={bronxDots} alt={"Image of the Bronx Borough Footprint"}/>
      </div>
    </article>
  );
};
