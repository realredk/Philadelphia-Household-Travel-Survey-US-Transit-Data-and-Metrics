
# Philadelphia Household Travel Survey US Transit Data and Metrics

## Overview

This project conducts a comprehensive analysis of the United States' transit systems using data from the National Transit Database. The focus is on key performance metrics for various transit modes in 2019, aiming to provide insights into operational efficiencies and areas for potential improvement.

## Project Structure

- `TS2.1TimeSeriesOpExpSvcModeTOS2021.Rda`: R data file containing the configured global environment necessary for the analysis.
- `Philadelphia Household Travel Survey US Transit Data and Metrics.R`: R script for conducting the analysis of transit data including calculations for fare recovery ratios and passenger miles.
- `Philadelphia Household Travel Survey US Transit Data and Metrics.docx`: Document describing the project's purpose, methodology, and preliminary results.
- `Philadelphia Household Travel Survey US Transit Data and Metrics.pdf`: Comprehensive report outlining detailed findings and analyses.
- `SEPTA_ridership.html`, `Describe_NTD_data.html`, `bus_ridership_per_km.html`: HTML files providing visualizations and additional insights into the data.
- `DVRPC_HTS_Data_Dictionary.xlsx`: Excel file serving as a data dictionary, essential for understanding the dataset fields.
- `Data`:
  - `1_Household_Public.csv`: Data on household characteristics and compositions.
  - `2_Person_Public.csv`: Individual-level data capturing demographic and travel behavior.
  - `3_Vehicle_Public.csv`: Information on household vehicle ownership and usage.
  - `4_Trip_Public.csv`: Detailed records of trips including mode, duration, and purpose.

## Project Objectives

The goal of this project is to deeply analyze and understand the performance metrics of U.S. transit systems in 2019, with a focus on:
- Evaluating passenger miles traveled relative to unlinked passenger trips and directional route miles.
- Analyzing fare revenues relative to the miles traveled and the overall cost of operations.
- Assessing the operational efficiencies of different transit modes through metrics such as fare recovery ratios and average vehicle speeds.
- Comparing operational performance across various cities and transit modes to identify patterns and suggest improvements.

## Key Findings

- There are marked differences in fare recovery ratios among different transit modes, with heavy and commuter rails generally performing better than buses and light rails.
- Average speeds across transit modes suggest potential areas for efficiency improvement.
- The comprehensive analysis highlights the economic aspects of transit operations, providing a foundation for policy recommendations.

## Usage

To replicate the analysis and review the findings:
1. Load the R data environment from `TS2.1TimeSeriesOpExpSvcModeTOS2021.Rda`.
2. Run the scripts in `Philadelphia Household Travel Survey US Transit Data and Metrics.R`.
3. Consult the `.docx` and `.pdf` files for detailed methodology and findings.
4. Review the HTML visualizations for additional insights.

## Acknowledgements

This project was supported by the University of Pennsylvania under the supervision of Professor Erick Guerra. Thanks also to all data providers and collaborators for their contributions.
