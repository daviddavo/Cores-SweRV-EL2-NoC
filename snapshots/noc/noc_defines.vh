`define RV_EXU_NOC
`define EXU_NOC_HEIGHT 3
`define EXU_NOC_WIDTH 3

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
// POS_DIV_SND is never used

// MUL WR on the eastmost north port
`define I_MUL_WR_UP   north_down[ `EXU_NOC_WIDTH-1 ]
`define I_MUL_WR_DOWN north_up[ `EXU_NOC_WIDTH-1 ]
`define I_MUL_SND     east_down[0]
`define I_MUL_RCV     east_up[0]
`define POS_MUL_WRAPPER_X 0
`define POS_MUL_WRAPPER_Y ( `EXU_NOC_WIDTH )
`define POS_MUL_WRAPPER '{ `POS_MUL_WRAPPER_X, `POS_MUL_WRAPPER_Y }
// MUL RCV/SND on the northmost east port 
`define POS_MUL_RCV_X 1
`define POS_MUL_RCV_Y ( `EXU_NOC_WIDTH+1 )
`define POS_MUL_RCV '{ `POS_MUL_RCV_X, `POS_MUL_RCV_Y }
// POS_MUL_SND is never used
