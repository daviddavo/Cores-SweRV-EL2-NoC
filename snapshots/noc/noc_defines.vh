`define RV_EXU_NOC
// WRAPPER_DIV is located on north[0]
`define I_DIV_WR_UP   north_down[0]
`define I_DIV_WR_DOWN north_up[0]
`define I_DIV_SND     west_down[0]
`define I_DIV_RCV     west_up[0]
`define POS_DIV_WRAPPER_X 0
`define POS_DIV_WRAPPER_Y 1
`define POS_DIV_WRAPPER '{ `POS_DIV_WRAPPER_X, `POS_DIV_WRAPPER_Y }
`define POS_DIV_RCV_X 1
`define POS_DIV_RCV_Y 0
`define POS_DIV_RCV '{ `POS_DIV_RCV_X, `POS_DIV_RCV_Y }
// POS_DIV_SND is necer used