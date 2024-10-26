import * as React from 'react';
import { Link, useNavigate } from 'react-router-dom';
export default function LinkGoBack({ children, className }: { children?: React.ReactNode, className?: string }) {
    const navigate = useNavigate();

    return <Link to={'..'} onClick={(e) => {
        e.preventDefault();
        navigate(-1)
    }}
        className={className}>
        {children}
    </Link>;
}