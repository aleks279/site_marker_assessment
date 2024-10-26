import { clsx, type ClassValue } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
    return twMerge(clsx(inputs))
}

export const getCsrf = () => {
    return (document?.querySelector?.('meta[name="csrf-token"]') as HTMLMetaElement)?.content
}

export const setCsrf = (value: string) => {
    const csrfMetaTag = document.querySelector('meta[name="csrf-token"]');
    if (csrfMetaTag) {
        csrfMetaTag.setAttribute("content", value);
    }
}

export const signOut = () => {
    fetch('/users/sign_out', {
        method: 'DELETE', headers: {
            'Content-type': 'application/json; charset=UTF-8',
            'X-Requested-With': 'XMLHttpRequest',
            'X-CSRF-Token': getCsrf()
        }
    }).then(() => window.location.reload());
}
