import React from "react";
import { Share2 } from "lucide-react";

const Icon = ({ className }: {
    className?: string;
}) => <Share2 className={className || "w-8 h-8 text-gray-200 mr-2"} />

export default Icon;