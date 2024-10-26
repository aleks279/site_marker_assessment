import { Project } from "@/models";
import { useMutation, useQueryClient } from "@tanstack/react-query";
import { postHeaders } from "./helpers";
export default function useCreateProject() {
    const queryClient = useQueryClient();
    return useMutation({
        mutationFn: async (newProject: Project) => {
            const response = await fetch('/projects.json', {
                method: 'POST',
                headers: postHeaders(),
                body: JSON.stringify(newProject),
            });

            if (!response.ok) {
                throw new Error('Failed to create todo');
            }

            return response.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ['projects'] })
        },
    })
}