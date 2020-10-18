import React, { useState } from "react";

export default function COMPONENT(params) {
  const [variable, useVariable] = useState("defaultVar");
  return <>{variable}</>;
}
