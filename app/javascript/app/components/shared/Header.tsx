import React from 'react';
import { Link } from 'react-router-dom';
import Icon from '@/components/shared/Icon';
import { Button } from '@/ui/button';
import { LogOut } from 'lucide-react';
import { signOut } from '@/lib/utils';
export default function Header({ children }: { children?: React.ReactNode }) {
    return <header className="p-4 flex justify-between items-center">
        <Link to="/" className="flex items-center">
            <Icon />
            <h1 className="text-2xl font-bold">Sharing</h1>
        </Link>
        <div className="space-x-2">
            {children}
            <Button variant="ghost" onClick={signOut}>
                <LogOut className="w-5 h-5 mr-2" />
                Sign Out
            </Button>
        </div>
    </header>
}